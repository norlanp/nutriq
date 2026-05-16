import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/bmr_calculation_entity.dart';
import 'package:nutriq/core/domain/entity/user_bmi_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_gender_entity.dart';
import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/utils/calc/unit_calc.dart';
import 'package:nutriq/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:nutriq/features/profile/presentation/widgets/bmi_overview.dart';
import 'package:nutriq/features/profile/presentation/widgets/bmr_overview.dart';
import 'package:nutriq/features/profile/presentation/widgets/set_gender_dialog.dart';
import 'package:nutriq/features/profile/presentation/widgets/set_goal_dialog.dart';
import 'package:nutriq/features/profile/presentation/widgets/set_height_dialog.dart';
import 'package:nutriq/features/profile/presentation/widgets/set_pal_category_dialog.dart';
import 'package:nutriq/features/profile/presentation/widgets/set_weight_dialog.dart';
import 'package:nutriq/generated/l10n.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileNotifierProvider);

    return profileAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: CircularProgressIndicator()),
      data: (state) => _getLoadedContent(
        context,
        state.userBMI,
        state.userEntity,
        state.usesImperialUnits,
        state.bmrCalculation,
        state.tdeeMethod,
      ),
    );
  }

  Widget _getLoadedContent(
      BuildContext context,
      UserBMIEntity userBMIEntity,
      UserEntity user,
      bool usesImperialUnits,
      BMRCalculationEntity bmrCalculation,
      TDEEMethodEntity tdeeMethod) {
    return ListView(
      children: [
        const SizedBox(height: 32.0),
        BMIOverview(
          bmiValue: userBMIEntity.bmiValue,
          nutritionalStatus: userBMIEntity.nutritionalStatus,
        ),
        const SizedBox(height: 16.0),
        BMROverview(
          bmrCalculation: bmrCalculation,
          tdeeMethod: tdeeMethod,
          onMethodChanged: (method) {
            ref.read(profileNotifierProvider.notifier).changeTDEEMethod(method);
          },
        ),
        const SizedBox(height: 8.0),
        ListTile(
          title: Text(
            S.of(context).activityLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            user.pal.getName(context),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.directions_walk_outlined),
          ),
          onTap: () => _showSetPALCategoryDialog(context, user),
        ),
        ListTile(
          title: Text(
            S.of(context).goalLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            user.goal.getName(context),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.flag_outlined),
          ),
          onTap: () => _showSetGoalDialog(context, user),
        ),
        ListTile(
          title: Text(
            S.of(context).weightLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            '${getDisplayWeight(user, usesImperialUnits)} ${usesImperialUnits ? S.of(context).lbsLabel : S.of(context).kgLabel}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.monitor_weight_outlined),
          ),
          onTap: () {
            _showSetWeightDialog(context, user, usesImperialUnits);
          },
        ),
        ListTile(
          title: Text(
            S.of(context).heightLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            '${getDisplayHeight(user, usesImperialUnits)} ${usesImperialUnits ? S.of(context).ftLabel : S.of(context).cmLabel}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.height_outlined),
          ),
          onTap: () {
            _showSetHeightDialog(context, user, usesImperialUnits);
          },
        ),
        ListTile(
          title: Text(
            S.of(context).ageLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            S.of(context).yearsLabel(user.age),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.cake_outlined),
          ),
          onTap: () {
            _showSetBirthdayDialog(context, user);
          },
        ),
        ListTile(
          title: Text(
            S.of(context).genderLabel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            user.gender.getName(context),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: SizedBox(
            height: double.infinity,
            child: Icon(user.gender.getIcon()),
          ),
          onTap: () {
            _showSetGenderDialog(context, user);
          },
        ),
      ],
    );
  }

  Future<void> _showSetPALCategoryDialog(
      BuildContext context, UserEntity userEntity) async {
    final selectedPalCategory = await showDialog<UserPALEntity>(
        context: context,
        builder: (BuildContext context) => const SetPALCategoryDialog());
    if (selectedPalCategory != null) {
      final updated = userEntity.copyWith(pal: selectedPalCategory);
      ref.read(profileNotifierProvider.notifier).updateUser(updated);
    }
  }

  Future<void> _showSetGoalDialog(
      BuildContext context, UserEntity userEntity) async {
    final selectedGoal = await showDialog<UserWeightGoalEntity>(
        context: context,
        builder: (BuildContext context) => const SetWeightGoalDialog());
    if (selectedGoal != null) {
      final updated = userEntity.copyWith(goal: selectedGoal);
      ref.read(profileNotifierProvider.notifier).updateUser(updated);
    }
  }

  Future<void> _showSetHeightDialog(BuildContext context, UserEntity userEntity,
      bool usesImperialUnits) async {
    final selectedHeight = await showDialog<double>(
        context: context,
        builder: (context) => SetHeightDialog(
              userHeight: usesImperialUnits
                  ? UnitCalc.cmToFeet(userEntity.heightCM)
                  : userEntity.heightCM,
              usesImperialUnits: usesImperialUnits,
            ));
    if (selectedHeight != null) {
      final heightCm = usesImperialUnits
          ? UnitCalc.feetToCm(selectedHeight)
          : selectedHeight;
      final updated = userEntity.copyWith(heightCM: heightCm);
      ref.read(profileNotifierProvider.notifier).updateUser(updated);
    }
  }

  Future<void> _showSetWeightDialog(BuildContext context, UserEntity userEntity,
      bool usesImperialSystem) async {
    final selectedWeight = await showDialog<double>(
        context: context,
        builder: (context) => SetWeightDialog(
              userWeight: usesImperialSystem
                  ? UnitCalc.kgToLbs(userEntity.weightKG)
                  : userEntity.weightKG,
              usesImperialUnits: usesImperialSystem,
            ));
    if (selectedWeight != null) {
      final weightKg = usesImperialSystem
          ? UnitCalc.lbsToKg(selectedWeight)
          : selectedWeight;
      final updated = userEntity.copyWith(weightKG: weightKg);
      ref.read(profileNotifierProvider.notifier).updateUser(updated);
    }
  }

  Future<void> _showSetBirthdayDialog(
      BuildContext context, UserEntity userEntity) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: userEntity.birthday,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (selectedDate != null) {
      final updated = userEntity.copyWith(birthday: selectedDate);
      ref.read(profileNotifierProvider.notifier).updateUser(updated);
    }
  }

  Future<void> _showSetGenderDialog(
      BuildContext context, UserEntity userEntity) async {
    final selectedGender = await showDialog<UserGenderEntity>(
        context: context,
        builder: (BuildContext context) => const SetGenderDialog());
    if (selectedGender != null) {
      final updated = userEntity.copyWith(gender: selectedGender);
      ref.read(profileNotifierProvider.notifier).updateUser(updated);
    }
  }
}