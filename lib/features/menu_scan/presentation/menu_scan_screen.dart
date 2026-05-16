import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/menu_scan/presentation/menu_items_screen.dart';
import 'package:nutriq/features/menu_scan/presentation/notifier/menu_scan_notifier.dart';
import 'package:nutriq/features/menu_scan/presentation/notifier/menu_scan_state.dart';
import 'package:nutriq/generated/l10n.dart';

class MenuScanScreen extends ConsumerStatefulWidget {
  const MenuScanScreen({super.key});

  @override
  ConsumerState<MenuScanScreen> createState() => _MenuScanScreenState();
}

class _MenuScanScreenState extends ConsumerState<MenuScanScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(menuScanNotifierProvider);
    final notifier = ref.read(menuScanNotifierProvider.notifier);

    ref.listen<MenuScanState>(menuScanNotifierProvider, (prev, next) {
      if (next.status == MenuScanStatus.added) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.menuScanAddedCount(next.addedCount)),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pop();
      }
      if (next.status == MenuScanStatus.scanCancelled) {
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.menuScanTitle),
      ),
      body: _buildBody(context, l10n, state, notifier),
    );
  }

  Widget _buildBody(BuildContext context, S l10n, MenuScanState state, MenuScanNotifier notifier) {
    if (state.status == MenuScanStatus.scanning) {
      return _buildScanningView(context, l10n);
    }
    if (state.status == MenuScanStatus.parsed) {
      return MenuItemsScreen(items: state.items);
    }
    if (state.status == MenuScanStatus.adding) {
      return _buildAddingView(context, l10n);
    }
    if (state.status == MenuScanStatus.error) {
      return _buildErrorView(context, l10n, state, notifier);
    }
    return _buildInitialView(context, l10n, notifier);
  }

  Widget _buildInitialView(BuildContext context, S l10n, MenuScanNotifier notifier) {
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
            onPressed: () => notifier.captureMenu(),
            icon: const Icon(Icons.camera_alt),
            label: Text(l10n.menuScanCaptureButton),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => notifier.pickMenuFromGallery(),
            icon: const Icon(Icons.photo_library),
            label: Text(l10n.menuScanGalleryButton),
          ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: () {
              context.go(AppRoutes.addMeal);
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

  Widget _buildErrorView(BuildContext context, S l10n, MenuScanState state, MenuScanNotifier notifier) {
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
              state.errorMessage ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => notifier.captureMenu(),
            child: Text(l10n.retryLabel),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () => notifier.pickMenuFromGallery(),
            icon: const Icon(Icons.photo_library),
            label: Text(l10n.menuScanGalleryButton),
          ),
        ],
      ),
    );
  }
}