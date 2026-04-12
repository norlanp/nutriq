part of 'water_bloc.dart';

abstract class WaterEvent extends Equatable {
  const WaterEvent();

  @override
  List<Object?> get props => [];
}

class LoadWater extends WaterEvent {
  final DateTime date;
  final int dailyGoal;

  const LoadWater({required this.date, this.dailyGoal = 2000});

  @override
  List<Object?> get props => [date, dailyGoal];
}

class AddWater extends WaterEvent {
  final WaterEntity entry;
  final DateTime date;
  final int dailyGoal;

  const AddWater(
      {required this.entry, required this.date, this.dailyGoal = 2000});

  @override
  List<Object?> get props => [entry, date, dailyGoal];
}

class DeleteWater extends WaterEvent {
  final WaterEntity entry;
  final DateTime date;
  final int dailyGoal;

  const DeleteWater(
      {required this.entry, required this.date, this.dailyGoal = 2000});

  @override
  List<Object?> get props => [entry, date, dailyGoal];
}

class UpdateDailyGoal extends WaterEvent {
  final int dailyGoal;

  const UpdateDailyGoal(this.dailyGoal);

  @override
  List<Object?> get props => [dailyGoal];
}
