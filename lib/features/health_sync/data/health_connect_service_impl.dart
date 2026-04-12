import 'package:health/health.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class HealthConnectServiceImpl implements HealthSyncService {
  final Health _health = Health();

  @override
  Future<bool> requestAuthorization() async {
    final types = [
      HealthDataType.STEPS,
      HealthDataType.WORKOUT,
      HealthDataType.WEIGHT,
    ];

    final permissions = types.map((_) => HealthDataAccess.READ_WRITE).toList();

    return await _health.requestAuthorization(types, permissions: permissions);
  }

  @override
  Future<int> readSteps(DateTime start, DateTime end) async {
    final data = await _health.getHealthDataFromTypes(
      types: [HealthDataType.STEPS],
      startTime: start,
      endTime: end,
    );

    int totalSteps = 0;
    for (final point in data) {
      if (point.value is NumericHealthValue) {
        totalSteps += (point.value as NumericHealthValue).numericValue.toInt();
      }
    }
    return totalSteps;
  }

  @override
  Future<List<HealthWorkout>> readWorkouts(DateTime start, DateTime end) async {
    final data = await _health.getHealthDataFromTypes(
      types: [HealthDataType.WORKOUT],
      startTime: start,
      endTime: end,
    );

    return data
        .whereType<HealthDataPoint>()
        .where((point) => point.value is WorkoutHealthValue)
        .map((point) {
      final workout = point.value as WorkoutHealthValue;
      return HealthWorkout(
        type: workout.workoutActivityType.name,
        startTime: point.dateFrom,
        endTime: point.dateTo,
        caloriesBurned: workout.totalEnergyBurned?.toInt(),
      );
    }).toList();
  }

  @override
  Future<double?> readWeight(DateTime start, DateTime end) async {
    final data = await _health.getHealthDataFromTypes(
      types: [HealthDataType.WEIGHT],
      startTime: start,
      endTime: end,
    );

    if (data.isEmpty) return null;

    final sorted = data
        .where((point) => point.value is NumericHealthValue)
        .toList()
      ..sort((a, b) => b.dateTo.compareTo(a.dateTo));

    if (sorted.isEmpty) return null;

    return (sorted.first.value as NumericHealthValue).numericValue.toDouble();
  }

  @override
  Future<void> writeWeight(double weightKg, DateTime date) async {
    await _health.writeHealthData(
      type: HealthDataType.WEIGHT,
      value: weightKg,
      startTime: date,
      endTime: date,
    );
  }
}
