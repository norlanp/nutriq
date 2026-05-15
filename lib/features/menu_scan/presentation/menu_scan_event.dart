part of 'menu_scan_bloc.dart';

abstract class MenuScanEvent extends Equatable {
  const MenuScanEvent();

  @override
  List<Object?> get props => [];
}

class CaptureMenu extends MenuScanEvent {
  const CaptureMenu();
}

class PickMenuFromGallery extends MenuScanEvent {
  const PickMenuFromGallery();
}

class SelectItem extends MenuScanEvent {
  final ScannedMenuItem item;

  const SelectItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class DeselectItem extends MenuScanEvent {
  final ScannedMenuItem item;

  const DeselectItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class AddSelected extends MenuScanEvent {
  const AddSelected();
}

class ResetScan extends MenuScanEvent {
  const ResetScan();
}
