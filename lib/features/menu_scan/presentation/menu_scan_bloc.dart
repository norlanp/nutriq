import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/usecase/add_intake_usecase.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/features/menu_scan/domain/entity/scanned_menu_item.dart';
import 'package:nutriq/features/menu_scan/domain/usecase/scan_menu_usecase.dart';

part 'menu_scan_event.dart';
part 'menu_scan_state.dart';

class MenuScanBloc extends Bloc<MenuScanEvent, MenuScanState> {
  final ScanMenuUsecase _scanMenuUsecase;
  final AddIntakeUsecase _addIntakeUsecase;

  MenuScanBloc(
    this._scanMenuUsecase,
    this._addIntakeUsecase,
  ) : super(MenuScanInitial()) {
    on<CaptureMenu>(_onCaptureMenu);
    on<PickMenuFromGallery>(_onPickMenuFromGallery);
    on<SelectItem>(_onSelectItem);
    on<DeselectItem>(_onDeselectItem);
    on<AddSelected>(_onAddSelected);
    on<ResetScan>(_onResetScan);
  }

  Future<void> _onCaptureMenu(
    CaptureMenu event,
    Emitter<MenuScanState> emit,
  ) async {
    emit(MenuScanScanning());
    try {
      final items = await _scanMenuUsecase.scanFromCamera();
      if (items.isEmpty) {
        emit(MenuScanScanCancelled());
      } else {
        emit(MenuScanParsed(items: items));
      }
    } catch (e) {
      emit(MenuScanError(message: e.toString()));
    }
  }

  Future<void> _onPickMenuFromGallery(
    PickMenuFromGallery event,
    Emitter<MenuScanState> emit,
  ) async {
    emit(MenuScanScanning());
    try {
      final items = await _scanMenuUsecase.scanFromGallery();
      if (items.isEmpty) {
        emit(MenuScanScanCancelled());
      } else {
        emit(MenuScanParsed(items: items));
      }
    } catch (e) {
      emit(MenuScanError(message: e.toString()));
    }
  }

  void _onSelectItem(
    SelectItem event,
    Emitter<MenuScanState> emit,
  ) {
    if (state is MenuScanParsed) {
      final current = state as MenuScanParsed;
      final updatedItems = current.items.map((item) {
        if (item.name == event.item.name) {
          return item.copyWith(isSelected: true);
        }
        return item;
      }).toList();
      emit(MenuScanParsed(items: updatedItems));
    }
  }

  void _onDeselectItem(
    DeselectItem event,
    Emitter<MenuScanState> emit,
  ) {
    if (state is MenuScanParsed) {
      final current = state as MenuScanParsed;
      final updatedItems = current.items.map((item) {
        if (item.name == event.item.name) {
          return item.copyWith(isSelected: false);
        }
        return item;
      }).toList();
      emit(MenuScanParsed(items: updatedItems));
    }
  }

  Future<void> _onAddSelected(
    AddSelected event,
    Emitter<MenuScanState> emit,
  ) async {
    if (state is MenuScanParsed) {
      final current = state as MenuScanParsed;
      final selectedItems = current.items.where((i) => i.isSelected).toList();

      emit(MenuScanAdding());

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
            await _addIntakeUsecase.addIntake(intake);
          }
        }
        emit(MenuScanAdded(count: selectedItems.length));
      } catch (e) {
        emit(MenuScanError(message: e.toString()));
      }
    }
  }

  void _onResetScan(
    ResetScan event,
    Emitter<MenuScanState> emit,
  ) {
    emit(MenuScanInitial());
  }
}
