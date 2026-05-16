import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/domain/service/grocery_check_service.dart';
import 'package:nutriq/core/presentation/widgets/food_grade_badge.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/grocery_check/presentation/grocery_check_bloc.dart';
import 'package:nutriq/features/grocery_check/presentation/widgets/product_card.dart';
import 'package:nutriq/generated/l10n.dart';

class GroceryCheckScreen extends ConsumerStatefulWidget {
  const GroceryCheckScreen({super.key});

  @override
  ConsumerState<GroceryCheckScreen> createState() => _GroceryCheckScreenState();
}

class _GroceryCheckScreenState extends ConsumerState<GroceryCheckScreen> {
  late GroceryCheckBloc _bloc;

  @override
  void initState() {
    _bloc = ref.read(groceryCheckBlocProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocProvider<GroceryCheckBloc>(
      create: (_) => _bloc,
      child: BlocConsumer<GroceryCheckBloc, GroceryCheckState>(
        listener: (context, state) {
          if (state is GroceryCheckError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message.contains('not found')
                      ? s.groceryCheckProductNotFound
                      : state.message,
                ),
              ),
            );
          } else if (state is GroceryCheckLoaded && state.items.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(s.groceryCheckItemAdded)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(s.groceryCheckTitle),
              actions: [
                if (state.items.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.delete_sweep),
                    tooltip: s.groceryCheckClearAll,
                    onPressed: () {
                      _bloc.add(const GroceryCheckClearList());
                    },
                  ),
              ],
            ),
            body: _buildBody(context, state, s),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _scanBarcode(context),
              child: const Icon(Icons.barcode_reader),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, GroceryCheckState state, S s) {
    if (state is GroceryCheckInitial) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined,
                size: 64, color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 16),
            Text(
              s.groceryCheckEmptyList,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }

    if (state is GroceryCheckLoading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final items = state.items;
    final isLoading = state is GroceryCheckLoading;

    return Stack(
      children: [
        Column(
          children: [
            if (isLoading) const LinearProgressIndicator(),
            if (items.length >= 2)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.compare_arrows),
                    label: Text(s.groceryCheckCompareButton),
                    onPressed: () {
                      _showComparison(context, items);
                    },
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 80),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    item: items[index],
                    index: index,
                    onRemove: () {
                      _bloc.add(GroceryCheckRemoveProduct(index: index));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _scanBarcode(BuildContext context) async {
    final barcode = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => const _BarcodeScannerPage(),
      ),
    );
    if (barcode != null && mounted) {
      _bloc.add(GroceryCheckScanProduct(barcode: barcode));
    }
  }

  void _showComparison(BuildContext context, List<GroceryCheckItem> items) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => _ComparisonSheet(items: items),
    );
  }
}

class _BarcodeScannerPage extends StatefulWidget {
  const _BarcodeScannerPage();

  @override
  State<_BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<_BarcodeScannerPage> {
  final MobileScannerController _controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.groceryCheckScanButton),
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: _controller,
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
            onPressed: () => _controller.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.flip_camera_android_outlined),
            onPressed: () => _controller.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        controller: _controller,
        onDetect: (capture) {
          for (final barcode in capture.barcodes) {
            if (barcode.rawValue != null &&
                barcode.type == BarcodeType.product) {
              Navigator.of(context).pop(barcode.rawValue);
              return;
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ComparisonSheet extends StatelessWidget {
  final List<GroceryCheckItem> items;

  const _ComparisonSheet({required this.items});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    if (items.length < 2) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(child: Text(s.groceryCheckSelectTwoHint)),
      );
    }

    final a = items[0];
    final b = items[1];
    final nA = a.product.nutriments;
    final nB = b.product.nutriments;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                s.groceryCheckComparisonTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _ComparisonHeader(item: a)),
                  const SizedBox(width: 8),
                  Expanded(child: _ComparisonHeader(item: b)),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '${s.nutritionInfoLabel} (${s.groceryCheckPer100gml})',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              _ComparisonRow(
                label: s.caloriesLabel,
                unit: s.kcalLabel,
                valueA: nA.energyKcal100,
                valueB: nB.energyKcal100,
                lowerIsBetter: true,
              ),
              _ComparisonRow(
                label: s.proteinLabel,
                unit: 'g',
                valueA: nA.proteins100,
                valueB: nB.proteins100,
                lowerIsBetter: false,
              ),
              _ComparisonRow(
                label: s.carbohydrateLabel,
                unit: 'g',
                valueA: nA.carbohydrates100,
                valueB: nB.carbohydrates100,
                lowerIsBetter: true,
              ),
              _ComparisonRow(
                label: s.sugarLabel,
                unit: 'g',
                valueA: nA.sugars100,
                valueB: nB.sugars100,
                lowerIsBetter: true,
              ),
              _ComparisonRow(
                label: s.fiberLabel,
                unit: 'g',
                valueA: nA.fiber100,
                valueB: nB.fiber100,
                lowerIsBetter: false,
              ),
              _ComparisonRow(
                label: s.fatLabel,
                unit: 'g',
                valueA: nA.fat100,
                valueB: nB.fat100,
                lowerIsBetter: true,
              ),
              _ComparisonRow(
                label: s.saturatedFatLabel,
                unit: 'g',
                valueA: nA.saturatedFat100,
                valueB: nB.saturatedFat100,
                lowerIsBetter: true,
              ),
              _ComparisonRow(
                label: s.sodiumLabel,
                unit: 'mg',
                valueA: nA.sodium100,
                valueB: nB.sodium100,
                lowerIsBetter: true,
              ),
              const SizedBox(height: 24),
              Center(
                child: _WinnerBadge(gradeA: a.grade, gradeB: b.grade),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class _ComparisonHeader extends StatelessWidget {
  final GroceryCheckItem item;

  const _ComparisonHeader({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        FoodGradeBadge(grade: item.grade, size: 40),
        const SizedBox(height: 4),
        Text(
          item.product.name ?? S.of(context).notAvailableLabel,
          style:
              theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ComparisonRow extends StatelessWidget {
  final String label;
  final String unit;
  final double? valueA;
  final double? valueB;
  final bool lowerIsBetter;

  const _ComparisonRow({
    required this.label,
    required this.unit,
    required this.valueA,
    required this.valueB,
    required this.lowerIsBetter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final aWins = _aIsBetter();
    final bWins = _bIsBetter();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              valueA != null ? '${valueA!.toStringAsFixed(1)} $unit' : '-',
              textAlign: TextAlign.end,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: aWins ? FontWeight.bold : FontWeight.normal,
                color: aWins ? Colors.green : null,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              valueB != null ? '${valueB!.toStringAsFixed(1)} $unit' : '-',
              textAlign: TextAlign.start,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: bWins ? FontWeight.bold : FontWeight.normal,
                color: bWins ? Colors.green : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _aIsBetter() {
    if (valueA == null || valueB == null) return false;
    return lowerIsBetter ? valueA! < valueB! : valueA! > valueB!;
  }

  bool _bIsBetter() {
    if (valueA == null || valueB == null) return false;
    return lowerIsBetter ? valueB! < valueA! : valueB! > valueA!;
  }
}

class _WinnerBadge extends StatelessWidget {
  final FoodGrade gradeA;
  final FoodGrade gradeB;

  const _WinnerBadge({required this.gradeA, required this.gradeB});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    if (gradeA.index < gradeB.index) {
      return Chip(
        avatar: const Icon(Icons.emoji_events, size: 18),
        label: Text(s.groceryCheckWinner),
        backgroundColor: gradeA.color.withValues(alpha: 0.2),
      );
    } else if (gradeB.index < gradeA.index) {
      return Chip(
        avatar: const Icon(Icons.emoji_events, size: 18),
        label: Text(s.groceryCheckWinner),
        backgroundColor: gradeB.color.withValues(alpha: 0.2),
      );
    }

    return Chip(
      label: Text(
        '${s.foodGradeLabel}: ${gradeA.label} = ${gradeB.label}',
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}
