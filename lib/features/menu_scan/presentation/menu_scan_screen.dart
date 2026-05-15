import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/menu_scan/presentation/menu_scan_bloc.dart';
import 'package:nutriq/features/menu_scan/presentation/menu_items_screen.dart';
import 'package:nutriq/generated/l10n.dart';

class MenuScanScreen extends StatefulWidget {
  const MenuScanScreen({super.key});

  @override
  State<MenuScanScreen> createState() => _MenuScanScreenState();
}

class _MenuScanScreenState extends State<MenuScanScreen> {
  late MenuScanBloc _bloc;

  @override
  void initState() {
    _bloc = locator<MenuScanBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.menuScanTitle),
        ),
        body: BlocConsumer<MenuScanBloc, MenuScanState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is MenuScanAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.menuScanAddedCount(state.count)),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              Navigator.of(context).pop();
            }
            if (state is MenuScanScanCancelled) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            if (state is MenuScanScanning) {
              return _buildScanningView(context, l10n);
            }
            if (state is MenuScanParsed) {
              return MenuItemsScreen(items: state.items);
            }
            if (state is MenuScanAdding) {
              return _buildAddingView(context, l10n);
            }
            if (state is MenuScanError) {
              return _buildErrorView(context, state, l10n);
            }
            return _buildInitialView(context, l10n);
          },
        ),
      ),
    );
  }

  Widget _buildInitialView(BuildContext context, S l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.menuScanSubtitle,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              l10n.menuScanDescription,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          FilledButton.icon(
            onPressed: () => _bloc.add(const CaptureMenu()),
            icon: const Icon(Icons.camera_alt),
            label: Text(l10n.menuScanCaptureButton),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => _bloc.add(const PickMenuFromGallery()),
            icon: const Icon(Icons.photo_library),
            label: Text(l10n.menuScanGalleryButton),
          ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(NavigationOptions.addMealRoute);
            },
            icon: const Icon(Icons.search),
            label: Text(l10n.menuScanSearchManually),
          ),
        ],
      ),
    );
  }

  Widget _buildScanningView(BuildContext context, S l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(l10n.menuScanProcessing),
        ],
      ),
    );
  }

  Widget _buildAddingView(BuildContext context, S l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(l10n.menuScanAddingItems),
        ],
      ),
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    MenuScanError state,
    S l10n,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => _bloc.add(const CaptureMenu()),
            child: Text(l10n.retryLabel),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () => _bloc.add(const PickMenuFromGallery()),
            icon: const Icon(Icons.photo_library),
            label: Text(l10n.menuScanGalleryButton),
          ),
        ],
      ),
    );
  }
}
