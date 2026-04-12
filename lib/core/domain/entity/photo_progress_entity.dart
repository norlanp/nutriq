import 'package:equatable/equatable.dart';

class PhotoProgressEntity extends Equatable {
  final int id;
  final int userId;
  final String filePath;
  final DateTime date;
  final String tags;
  final String? note;

  const PhotoProgressEntity({
    required this.id,
    required this.userId,
    required this.filePath,
    required this.date,
    required this.tags,
    this.note,
  });

  @override
  List<Object?> get props => [id, userId, filePath, date, tags, note];
}
