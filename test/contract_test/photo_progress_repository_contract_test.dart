import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/photo_progress_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/photo_progress_dao.dart';
import 'package:nutriq/core/data/repository/photo_progress_repository.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';

void main() {
  late AppDatabase db;
  late PhotoProgressRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = PhotoProgressRepository(
      PhotoProgressDataSource(PhotoProgressDao(db)),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('addPhoto persists and getAllPhotos retrieves', () async {
    final entity = PhotoProgressEntity(
      id: 1,
      userId: 1,
      filePath: '/photos/test.jpg',
      date: DateTime(2024, 6, 15),
      tags: 'front,side',
    );
    await repo.addPhoto(entity);
    final results = await repo.getAllPhotos();
    expect(results.length, 1);
    expect(results.first.filePath, '/photos/test.jpg');
  });

  test('getAllPhotos returns empty initially', () async {
    final results = await repo.getAllPhotos();
    expect(results, isEmpty);
  });

  test('getLatestPhoto returns most recent', () async {
    final entity1 = PhotoProgressEntity(
      id: 1,
      userId: 1,
      filePath: '/photos/old.jpg',
      date: DateTime(2024, 1, 1),
      tags: 'front',
    );
    final entity2 = PhotoProgressEntity(
      id: 2,
      userId: 1,
      filePath: '/photos/new.jpg',
      date: DateTime(2024, 6, 15),
      tags: 'front',
    );
    await repo.addPhoto(entity1);
    await repo.addPhoto(entity2);
    final latest = await repo.getLatestPhoto();
    expect(latest, isNotNull);
    expect(latest!.filePath, '/photos/new.jpg');
  });

  test('getLatestPhoto returns null when no photos', () async {
    final latest = await repo.getLatestPhoto();
    expect(latest, isNull);
  });

  test('getPhotosByDateRange returns photos in range', () async {
    final entity1 = PhotoProgressEntity(
      id: 1,
      userId: 1,
      filePath: '/photos/jan.jpg',
      date: DateTime(2024, 1, 15),
      tags: 'front',
    );
    final entity2 = PhotoProgressEntity(
      id: 2,
      userId: 1,
      filePath: '/photos/jun.jpg',
      date: DateTime(2024, 6, 15),
      tags: 'front',
    );
    await repo.addPhoto(entity1);
    await repo.addPhoto(entity2);
    final results = await repo.getPhotosByDateRange(
      DateTime(2024, 6, 1),
      DateTime(2024, 6, 30),
    );
    expect(results.length, 1);
    expect(results.first.filePath, '/photos/jun.jpg');
  });

  test('deletePhoto removes photo', () async {
    final entity = PhotoProgressEntity(
      id: 1,
      userId: 1,
      filePath: '/photos/test.jpg',
      date: DateTime(2024, 6, 15),
      tags: 'front',
    );
    await repo.addPhoto(entity);
    await repo.deletePhoto(entity);
    final results = await repo.getAllPhotos();
    expect(results, isEmpty);
  });
}