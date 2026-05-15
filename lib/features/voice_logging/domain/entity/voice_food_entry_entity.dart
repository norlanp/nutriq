import 'package:equatable/equatable.dart';

class VoiceFoodEntryEntity extends Equatable {
  final String description;
  final double? quantity;
  final String? unit;

  const VoiceFoodEntryEntity({
    required this.description,
    this.quantity,
    this.unit,
  });

  @override
  List<Object?> get props => [description, quantity, unit];
}
