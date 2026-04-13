part of 'blood_glucose_bloc.dart';

abstract class BloodGlucoseEvent extends Equatable {
  const BloodGlucoseEvent();

  @override
  List<Object?> get props => [];
}

class LoadBloodGlucoseEntries extends BloodGlucoseEvent {
  final DateTime date;

  const LoadBloodGlucoseEntries({required this.date});

  @override
  List<Object?> get props => [date];
}

class AddBloodGlucoseEntry extends BloodGlucoseEvent {
  final BloodGlucoseEntity entry;
  final DateTime date;

  const AddBloodGlucoseEntry({required this.entry, required this.date});

  @override
  List<Object?> get props => [entry, date];
}

class DeleteBloodGlucoseEntry extends BloodGlucoseEvent {
  final BloodGlucoseEntity entry;
  final DateTime date;

  const DeleteBloodGlucoseEntry({required this.entry, required this.date});

  @override
  List<Object?> get props => [entry, date];
}

class LoadBloodGlucoseAverage extends BloodGlucoseEvent {
  final DateTime startDate;
  final DateTime endDate;

  const LoadBloodGlucoseAverage({
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
}
