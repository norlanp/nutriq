import 'package:equatable/equatable.dart';

enum TrackerType { scale, boolean, text }

class CustomTrackerEntity extends Equatable {
  final int id;
  final int userId;
  final String name;
  final TrackerType type;
  final double min;
  final double max;
  final String icon;
  final String? unit;

  const CustomTrackerEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    required this.min,
    required this.max,
    required this.icon,
    this.unit,
  });

  @override
  List<Object?> get props => [id, userId, name, type, min, max, icon, unit];
}
