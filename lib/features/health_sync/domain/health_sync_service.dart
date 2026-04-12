abstract class HealthSyncService {
  Future<bool> requestAuthorization();

  Future<int> readSteps(DateTime start, DateTime end);

  Future<List<HealthWorkout>> readWorkouts(DateTime start, DateTime end);

  Future<double?> readWeight(DateTime start, DateTime end);

  Future<void> writeWeight(double weightKg, DateTime date);
}

class HealthWorkout {
  final String type;
  final DateTime startTime;
  final DateTime endTime;
  final int? caloriesBurned;

  const HealthWorkout({
    required this.type,
    required this.startTime,
    required this.endTime,
    this.caloriesBurned,
  });
}
