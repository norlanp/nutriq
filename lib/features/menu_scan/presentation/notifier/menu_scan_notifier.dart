import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/menu_scan/domain/entity/scanned_menu_item.dart';
import 'package:nutriq/features/menu_scan/presentation/notifier/menu_scan_state.dart';

class MenuScanNotifier extends Notifier<MenuScanState> {
  @override
  MenuScanState build() => const MenuScanState();

  Future<void> captureMenu() async {
    state = const MenuScanState(status: MenuScanStatus.scanning, isLoading: true);
    try {
      final items = await ref.read(scanMenuUsecaseProvider).scanFromCamera();
      if (items.isEmpty) {
        state = const MenuScanState(status: MenuScanStatus.scanCancelled);
      } else {
        state = MenuScanState(status: MenuScanStatus.parsed, items: items);
      }
    } catch (e) {
      state = MenuScanState(status: MenuScanStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> pickMenuFromGallery() async {
    state = const MenuScanState(status: MenuScanStatus.scanning, isLoading: true);
    try {
      final items = await ref.read(scanMenuUsecaseProvider).scanFromGallery();
      if (items.isEmpty) {
        state = const MenuScanState(status: MenuScanStatus.scanCancelled);
      } else {
        state = MenuScanState(status: MenuScanStatus.parsed, items: items);
      }
    } catch (e) {
      state = MenuScanState(status: MenuScanStatus.error, errorMessage: e.toString());
    }
  }

  void selectItem(ScannedMenuItem item) {
    if (state.status == MenuScanStatus.parsed) {
      final updatedItems = state.items.map((i) {
        if (i.name == item.name) {
          return i.copyWith(isSelected: true);
        }
        return i;
      }).toList();
      state = state.copyWith(items: updatedItems);
    }
  }

  void deselectItem(ScannedMenuItem item) {
    if (state.status == MenuScanStatus.parsed) {
      final updatedItems = state.items.map((i) {
        if (i.name == item.name) {
          return i.copyWith(isSelected: false);
        }
        return i;
      }).toList();
      state = state.copyWith(items: updatedItems);
    }
  }

  Future<void> addSelected() async {
    if (state.status != MenuScanStatus.parsed) return;
    final selectedItems = state.items.where((i) => i.isSelected).toList();

    state = const MenuScanState(status: MenuScanStatus.adding, isLoading: true);

    try {
      for (final item in selectedItems) {
        if (item.mealMatch != null) {
          final intake = IntakeEntity(
            id: IdGenerator.getUniqueID(),
            unit: item.mealMatch!.mealUnit ?? 'g',
            amount: 100,
            type: IntakeTypeEntity.snack,
            meal: item.mealMatch!,
            dateTime: DateTime.now(),
          );
          await ref.read(addIntakeUsecaseProvider).addIntake(intake);
        }
      }
      state = MenuScanState(status: MenuScanStatus.added, addedCount: selectedItems.length);
    } catch (e) {
      state = MenuScanState(status: MenuScanStatus.error, errorMessage: e.toString());
    }
  }

  void resetScan() {
    state = const MenuScanState();
  }
}

final menuScanNotifierProvider =
    NotifierProvider<MenuScanNotifier, MenuScanState>(MenuScanNotifier.new);