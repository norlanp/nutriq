import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/core/utils/calc/calorie_goal_calc.dart';
import 'package:nutriq/core/utils/calc/macro_calc.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_data_mask_entity.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_notifier.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_form_notifier.dart';
import 'package:nutriq/features/onboarding/presentation/onboarding_intro_page_body.dart';
import 'package:nutriq/features/onboarding/presentation/widgets/onboarding_fourth_page_body.dart';
import 'package:nutriq/features/onboarding/presentation/widgets/onboarding_overview_page_body.dart';
import 'package:nutriq/features/onboarding/presentation/widgets/onboarding_third_page_body.dart';
import 'package:nutriq/features/onboarding/presentation/widgets/highlight_button.dart';
import 'package:nutriq/features/onboarding/presentation/widgets/onboarding_first_page_body.dart';
import 'package:nutriq/features/onboarding/presentation/widgets/onboarding_second_page_body.dart';
import 'package:nutriq/generated/l10n.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  final _pageDecoration = const PageDecoration(
      safeArea: 0, bodyAlignment: Alignment.topCenter, bodyFlex: 6);

  final _defaultImageWidget = null;

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(onboardingFormProvider);
    ref.watch(onboardingNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: _getLoadedContent(context, form),
      ),
    );
  }

  Widget _getLoadedContent(BuildContext context, OnboardingFormState form) {
    return IntroductionScreen(
        key: _introKey,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        back: const Icon(Icons.arrow_back_outlined),
        showBackButton: true,
        showNextButton: false,
        showDoneButton: false,
        isProgressTap: false,
        dotsFlex: 0,
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          activeColor: Theme.of(context).colorScheme.primary,
          activeSize: const Size(22.0, 10.0),
          activeShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        onChange: (_) {},
        pages: _getPageViewModels(form));
  }

  List<PageViewModel> _getPageViewModels(OnboardingFormState form) {
    return <PageViewModel>[
      PageViewModel(
          title: S.of(context).onboardingWelcomeLabel,
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: const OnboardingIntroPageBody(),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonStartLabel,
            onButtonPressed: () => _scrollToPage(1),
            buttonActive: form.introPageValid,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: const OnboardingFirstPageBody(),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonNextLabel,
            onButtonPressed: () => _scrollToPage(2),
            buttonActive: form.firstPageValid,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: const OnboardingSecondPageBody(),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonNextLabel,
            onButtonPressed: () => _scrollToPage(3),
            buttonActive: form.secondPageValid,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: const OnboardingThirdPageBody(),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonNextLabel,
            onButtonPressed: () => _scrollToPage(4),
            buttonActive: form.thirdPageValid,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: const OnboardingFourthPageBody(),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonNextLabel,
            onButtonPressed: () => _scrollToPage(5),
            buttonActive: form.fourthPageValid,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: OnboardingOverviewPageBody(
            calorieGoalDayString:
                _getCalorieGoal(form)?.toInt().toString() ?? "?",
            carbsGoalString:
                _getCarbsGoal(form)?.toInt().toString() ?? "?",
            fatGoalString:
                _getFatGoal(form)?.toInt().toString() ?? "?",
            proteinGoalString:
                _getProteinGoal(form)?.toInt().toString() ?? "?",
          ),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonStartLabel,
            onButtonPressed: () => _onOverviewStartButtonPressed(context),
            buttonActive: form.introPageValid &&
                form.firstPageValid &&
                form.secondPageValid &&
                form.thirdPageValid &&
                form.fourthPageValid,
          )),
    ];
  }

  void _scrollToPage(int page) {
    FocusScope.of(context).requestFocus(FocusNode());
    _introKey.currentState?.animateScroll(page);
  }

  double? _getCalorieGoal(OnboardingFormState form) {
    final userSelection = _formToUserSelection(form);
    final userEntity = userSelection.toUserEntity();
    if (userEntity != null) {
      return CalorieGoalCalc.getTotalKcalGoal(userEntity, 0);
    }
    return null;
  }

  double? _getCarbsGoal(OnboardingFormState form) {
    final calorieGoal = _getCalorieGoal(form);
    final userSelection = _formToUserSelection(form);
    if (userSelection.toUserEntity() != null && calorieGoal != null) {
      return MacroCalc.getTotalCarbsGoal(calorieGoal);
    }
    return null;
  }

  double? _getFatGoal(OnboardingFormState form) {
    final calorieGoal = _getCalorieGoal(form);
    final userSelection = _formToUserSelection(form);
    if (userSelection.toUserEntity() != null && calorieGoal != null) {
      return MacroCalc.getTotalFatsGoal(calorieGoal);
    }
    return null;
  }

  double? _getProteinGoal(OnboardingFormState form) {
    final calorieGoal = _getCalorieGoal(form);
    final userSelection = _formToUserSelection(form);
    if (userSelection.toUserEntity() != null && calorieGoal != null) {
      return MacroCalc.getTotalProteinsGoal(calorieGoal);
    }
    return null;
  }

  UserDataMaskEntity _formToUserSelection(OnboardingFormState form) {
    final heightCm = form.height.toCm();
    final weightKg = form.weight.toKg();
    return UserDataMaskEntity(
      gender: form.gender.value,
      birthday: form.birthday.value,
      height: heightCm,
      weight: weightKg,
      activity: form.activity.value,
      goal: form.goal.value,
      acceptDataCollection: form.acceptDataCollection,
      usesImperialUnits: form.usesImperialUnits,
    );
  }

  void _onOverviewStartButtonPressed(BuildContext context) {
    final form = ref.read(onboardingFormProvider);
    final userSelection = _formToUserSelection(form);
    final userEntity = userSelection.toUserEntity();
    if (userEntity != null) {
      ref.read(onboardingNotifierProvider.notifier).saveOnboardingData(
          userEntity, form.acceptDataCollection, form.usesImperialUnits);
      context.go(AppRoutes.main);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).onboardingSaveUserError)));
      _scrollToPage(1);
    }
  }
}