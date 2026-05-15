part of 'menu_scan_bloc.dart';

abstract class MenuScanState extends Equatable {
  const MenuScanState();

  @override
  List<Object?> get props => [];
}

class MenuScanInitial extends MenuScanState {
  const MenuScanInitial();
}

class MenuScanScanning extends MenuScanState {
  const MenuScanScanning();
}

class MenuScanScanCancelled extends MenuScanState {
  const MenuScanScanCancelled();
}

class MenuScanParsed extends MenuScanState {
  final List<ScannedMenuItem> items;

  const MenuScanParsed({required this.items});

  @override
  List<Object?> get props => [items];
}

class MenuScanAdding extends MenuScanState {
  const MenuScanAdding();
}

class MenuScanAdded extends MenuScanState {
  final int count;

  const MenuScanAdded({required this.count});

  @override
  List<Object?> get props => [count];
}

class MenuScanError extends MenuScanState {
  final String message;

  const MenuScanError({required this.message});

  @override
  List<Object?> get props => [message];
}
