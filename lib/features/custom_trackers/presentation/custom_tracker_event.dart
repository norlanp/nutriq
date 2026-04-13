part of 'custom_tracker_bloc.dart';

abstract class CustomTrackerEvent extends Equatable {
  const CustomTrackerEvent();

  @override
  List<Object?> get props => [];
}

class LoadTrackers extends CustomTrackerEvent {
  final int userId;
  final DateTime? date;

  const LoadTrackers({required this.userId, this.date});

  @override
  List<Object?> get props => [userId, date];
}

class CreateTracker extends CustomTrackerEvent {
  final CustomTrackerEntity entity;

  const CreateTracker({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class DeleteTracker extends CustomTrackerEvent {
  final int id;

  const DeleteTracker({required this.id});

  @override
  List<Object?> get props => [id];
}

class LogEntry extends CustomTrackerEvent {
  final CustomTrackerEntryEntity entity;

  const LogEntry({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class LoadEntries extends CustomTrackerEvent {
  final int userId;
  final DateTime date;

  const LoadEntries({required this.userId, required this.date});

  @override
  List<Object?> get props => [userId, date];
}
