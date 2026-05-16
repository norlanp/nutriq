import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/presentation/widgets/error_dialog.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/meal_detail/meal_detail_screen.dart';
import 'package:nutriq/features/scanner/presentation/notifier/scanner_notifier.dart';
import 'package:nutriq/features/scanner/presentation/notifier/scanner_state.dart';
import 'package:nutriq/generated/l10n.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  final log = Logger('ScannerScreen');

  String? _scannedBarcode;
  late IntakeTypeEntity _intakeTypeEntity;
  late DateTime _day;

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)?.settings.arguments as ScannerScreenArguments;
    _intakeTypeEntity = args.intakeTypeEntity;
    _day = args.day;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final scannerState = ref.watch(scannerNotifierProvider);

    if (scannerState.isLoading) {
      return Scaffold(
          appBar: AppBar(),
          body: const Center(child: CircularProgressIndicator()));
    }

    if (scannerState.isLoaded && scannerState.product != null) {
      final product = scannerState.product!;
      Future.microtask(() {
        if (context.mounted) {
          return Navigator.of(context).pushReplacementNamed(
              NavigationOptions.mealDetailRoute,
              arguments: MealDetailScreenArguments(
                  product, _intakeTypeEntity, _day, scannerState.usesImperialUnits));
        }
      });
    }

    if (scannerState.hasError) {
      return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: ErrorDialog(
              errorText: scannerState.errorType ==
                      ScannerFailedStateType.productNotFound
                  ? S.of(context).errorProductNotFound
                  : S.of(context).errorFetchingProductData,
              onRefreshPressed: _onRefreshButtonPressed,
            ),
          ));
    }

    return _getScannerContent(context);
  }

  Scaffold _getScannerContent(BuildContext context) {
    final cameraController = MobileScannerController();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).scanProductLabel),
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: cameraController,
              builder: (context, state, child) {
                switch (state.torchState) {
                  case TorchState.off || TorchState.unavailable:
                    return const Icon(Icons.flash_off_outlined,
                        color: Colors.grey);
                  case TorchState.on || TorchState.auto:
                    return const Icon(Icons.flash_on_outlined);
                }
              },
            ),
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.flip_camera_android_outlined),
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
          controller: cameraController,
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            for (final barcode in barcodes) {
              if (barcode.rawValue != null &&
                  barcode.type == BarcodeType.product) {
                final barcodeResult = barcode.rawValue;
                if (barcodeResult != null) {
                  _scannedBarcode = barcodeResult;
                  log.fine('Barcode found: $barcodeResult');
                  ref
                      .read(scannerNotifierProvider.notifier)
                      .loadProduct(barcodeResult);
                }
              }
            }
          }),
    );
  }

  void _onRefreshButtonPressed() {
    final barcode = _scannedBarcode;
    if (barcode != null) {
      ref.read(scannerNotifierProvider.notifier).loadProduct(barcode);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).errorFetchingProductData)));
    }
  }
}

class ScannerScreenArguments {
  final DateTime day;
  final IntakeTypeEntity intakeTypeEntity;

  ScannerScreenArguments(this.day, this.intakeTypeEntity);
}