import 'package:equatable/equatable.dart';
import 'package:nutriq/features/menu_scan/domain/entity/scanned_menu_item.dart';

enum MenuScanStatus {
  initial,
  scanning,
  scanCancelled,
  parsed,
  adding,
  added,
  error,
}

class MenuScanState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final MenuScanStatus status;
  final List<ScannedMenuItem> items;
  final int addedCount;

  const MenuScanState({
    this.isLoading = false,
    this.errorMessage,
    this.status = MenuScanStatus.initial,
    this.items = const [],
    this.addedCount = 0,
  });

  bool get hasError => errorMessage != null;

  MenuScanState copyWith({
    bool? isLoading,
    String? errorMessage,
    MenuScanStatus? status,
    List<ScannedMenuItem>? items,
    int? addedCount,
  }) {
    return MenuScanState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      status: status ?? this.status,
      items: items ?? this.items,
      addedCount: addedCount ?? this.addedCount,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, status, items, addedCount];
}