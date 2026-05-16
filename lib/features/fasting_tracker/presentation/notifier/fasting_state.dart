import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';

enum FastingStatus { initial, loading, active, inactive, error }

class FastingNotifierState extends Equatable {
  final FastingStatus status;
  final FastingEntity? activeFast;
  final Duration elapsed;
  final List<FastingEntity> history;
  final int streak;
  final String? errorMessage;

  const FastingNotifierState({
    this.status = FastingStatus.initial,
    this.activeFast,
    this.elapsed = Duration.zero,
    this.history = const [],
    this.streak = 0,
    this.errorMessage,
  });

  bool get isActive => status == FastingStatus.active;
  bool get isLoading => status == FastingStatus.loading;
  bool get hasError => status == FastingStatus.error;

  FastingNotifierState copyWith({
    FastingStatus? status,
    FastingEntity? activeFast,
    Duration? elapsed,
    List<FastingEntity>? history,
    int? streak,
    String? errorMessage,
  }) {
    return FastingNotifierState(
      status: status ?? this.status,
      activeFast: activeFast ?? this.activeFast,
      elapsed: elapsed ?? this.elapsed,
      history: history ?? this.history,
      streak: streak ?? this.streak,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, activeFast, elapsed, history, streak, errorMessage];
}