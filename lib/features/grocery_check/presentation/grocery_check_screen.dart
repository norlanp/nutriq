import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/service/grocery_check_service.dart';
import 'package:nutriq/features/grocery_check/presentation/notifier/grocery_check_notifier.dart';
import 'package:nutriq/features/grocery_check/presentation/notifier/grocery_check_state.dart';
import 'package:nutriq/features/grocery_check/presentation/widgets/barcode_scanner_page.dart';
import 'package:nutriq/features/grocery_check/presentation/widgets/comparison_sheet.dart';
import 'package:nutriq/features/grocery_check/presentation/widgets/product_card.dart';
import 'package:nutriq/generated/l10n.dart';

class GroceryCheckScreen extends ConsumerStatefulWidget {
  const GroceryCheckScreen({super.key});

  @override
  ConsumerState<GroceryCheckScreen> createState() => _GroceryCheckScreenState();
}

class _GroceryCheckScreenState extends ConsumerState<GroceryCheckScreen> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final state = ref.watch(groceryCheckNotifierProvider);
    final notifier = ref.read(groceryCheckNotifierProvider.notifier);

    ref.listen<GroceryCheckState>(groceryCheckNotifierProvider, (prev, next) {
      if (next.status == GroceryCheckStatus.error && next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.errorMessage!.contains('not found')
                  ? s.groceryCheckProductNotFound
                  : next.errorMessage!,
            ),
          ),
        );
      } else if (next.status == GroceryCheckStatus.loaded && next.items.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(s.groceryCheckItemAdded)),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(s.groceryCheckTitle),
        actions: [
          if (state.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: s.groceryCheckClearAll,
              onPressed: () {
                notifier.clearList();
              },
            ),
        ],
      ),
      body: _buildBody(context, state, s, notifier),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scanBarcode(context, notifier),
        child: const Icon(Icons.barcode_reader),
      ),
    );
  }

  Widget _buildBody(BuildContext context, GroceryCheckState state, S s, GroceryCheckNotifier notifier) {
    if (state.status == GroceryCheckStatus.initial) {
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

    if (state.isLoading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final items = state.items;
    final isLoading = state.isLoading;

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
                      notifier.removeProduct(index);
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

  void _scanBarcode(BuildContext context, GroceryCheckNotifier notifier) async {
    final barcode = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => const BarcodeScannerPage(),
      ),
    );
    if (barcode != null && mounted) {
      notifier.scanProduct(barcode);
    }
  }

  void _showComparison(BuildContext context, List<GroceryCheckItem> items) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => ComparisonSheet(items: items),
    );
  }
}