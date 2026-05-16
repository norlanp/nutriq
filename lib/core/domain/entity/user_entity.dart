import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nutriq/core/domain/entity/user_gender_entity.dart';
import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required DateTime birthday,
    required double heightCM,
    required double weightKG,
    required UserGenderEntity gender,
    required UserWeightGoalEntity goal,
    required UserPALEntity pal,
  }) = _UserEntity;

  const UserEntity._();

  int get age => DateTime.now().difference(birthday).inDays ~/ 365;
}