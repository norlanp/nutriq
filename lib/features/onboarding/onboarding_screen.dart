import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_activity_selection_entity.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_gender_selection_entity.dart';
import 'package:nutriq/features/onboarding/domain/entity/user_goal_selection_entity.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_notifier.dart';
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

  bool _introPageButtonActive = false;
  bool _firstPageButtonActive = false;
  bool _secondPageButtonActive = false;
  bool _thirdPageButtonActive = false;
  bool _fourthPageButtonActive = false;
  bool _overviewPageButtonActive = false;

  @override
  Widget build(BuildContext context) {
    ref.watch(onboardingNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: _getLoadedContent(context),
      ),
    );
  }

  Widget _getLoadedContent(BuildContext context) {
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
        onChange: onPageChanged,
        pages: _getPageViewModels());
  }

  List<PageViewModel> _getPageViewModels() {
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    return <PageViewModel>[
      PageViewModel(
          title: S.of(context).onboardingWelcomeLabel,
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: OnboardingIntroPageBody(
            setPageContent: _setIntroPageData,
          ),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonStartLabel,
            onButtonPressed: () => _scrollToPage(1),
            buttonActive: _introPageButtonActive,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: OnboardingFirstPageBody(
            setPageContent: _setFirstPageData,
          ),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonNextLabel,
            onButtonPressed: () => _scrollToPage(2),
            buttonActive: _firstPageButtonActive,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: OnboardingSecondPageBody(
            setButtonContent: _setSecondPageData,
          ),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonNextLabel,
            onButtonPressed: () => _scrollToPage(3),
            buttonActive: _secondPageButtonActive,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: OnboardingThirdPageBody(
            setButtonContent: _setThirdPageButton,
          ),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonNextLabel,
            onButtonPressed: () => _scrollToPage(4),
            buttonActive: _thirdPageButtonActive,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: OnboardingFourthPageBody(
            setButtonContent: _setFourthPageButton,
          ),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonNextLabel,
            onButtonPressed: () => _scrollToPage(5),
            buttonActive: _fourthPageButtonActive,
          )),
      PageViewModel(
          titleWidget: const SizedBox(),
          decoration: _pageDecoration,
          image: _defaultImageWidget,
          bodyWidget: OnboardingOverviewPageBody(
            calorieGoalDayString:
                notifier.getOverviewCalorieGoal()?.toInt().toString() ?? "?",
            carbsGoalString:
                notifier.getOverviewCarbsGoal()?.toInt().toString() ?? "?",
            fatGoalString:
                notifier.getOverviewFatGoal()?.toInt().toString() ?? "?",
            proteinGoalString:
                notifier.getOverviewProteinGoal()?.toInt().toString() ?? "?",
            setButtonActive: _setOverviewPageContent,
          ),
          footer: HighlightButton(
            buttonLabel: S.of(context).buttonStartLabel,
            onButtonPressed: () {
              _onOverviewStartButtonPressed(context);
            },
            buttonActive: _overviewPageButtonActive,
          )),
    ];
  }

  void _scrollToPage(int page) {
    FocusScope.of(context).requestFocus(FocusNode());
    _introKey.currentState?.animateScroll(page);
  }

  void _setIntroPageData(bool active, bool acceptedDataCollection) {
    final userSelection = ref.read(onboardingNotifierProvider);
    ref.read(onboardingNotifierProvider.notifier).updateUserSelection(
        userSelection.copyWith(acceptDataCollection: acceptedDataCollection));
    setState(() {
      _introPageButtonActive = active;
    });
  }

  void _setFirstPageData(bool active, UserGenderSelectionEntity? selectedGender,
      DateTime? selectedBirthday) {
    final userSelection = ref.read(onboardingNotifierProvider);
    ref.read(onboardingNotifierProvider.notifier).updateUserSelection(
        userSelection.copyWith(gender: selectedGender, birthday: selectedBirthday));
    setState(() {
      _firstPageButtonActive = active;
    });
  }

  void _setSecondPageData(bool active, double? selectedHeight,
      double? selectedWeight, bool usesImperial) {
    final userSelection = ref.read(onboardingNotifierProvider);
    ref.read(onboardingNotifierProvider.notifier).updateUserSelection(
        userSelection.copyWith(
            height: selectedHeight,
            weight: selectedWeight,
            usesImperialUnits: usesImperial));
    setState(() {
      _secondPageButtonActive = active;
    });
  }

  void _setThirdPageButton(
      bool active, UserActivitySelectionEntity? selectedActivity) {
    final userSelection = ref.read(onboardingNotifierProvider);
    ref.read(onboardingNotifierProvider.notifier).updateUserSelection(
        userSelection.copyWith(activity: selectedActivity));
    setState(() {
      _thirdPageButtonActive = active;
    });
  }

  void _setFourthPageButton(
      bool active, UserGoalSelectionEntity? selectedGoal) {
    final userSelection = ref.read(onboardingNotifierProvider);
    ref.read(onboardingNotifierProvider.notifier).updateUserSelection(
        userSelection.copyWith(goal: selectedGoal));
    setState(() {
      _fourthPageButtonActive = active;
    });
  }

  void onPageChanged(int page) {
    checkUserDataProvided();
  }

  void checkUserDataProvided() {
    final userSelection = ref.read(onboardingNotifierProvider);
    userSelection.checkDataProvided()
        ? _setOverviewPageContent(true)
        : _setOverviewPageContent(false);
  }

  void _setOverviewPageContent(bool active) {
    setState(() {
      _overviewPageButtonActive = active;
    });
  }

  void _onOverviewStartButtonPressed(BuildContext context) {
    final userSelection = ref.read(onboardingNotifierProvider);
    final userEntity = userSelection.toUserEntity();
    final hasAcceptedDataCollection = userSelection.acceptDataCollection;
    final usesImperialUnits = userSelection.usesImperialUnits;
    if (userEntity != null) {
      ref.read(onboardingNotifierProvider.notifier).saveOnboardingData(
          userEntity, hasAcceptedDataCollection, usesImperialUnits);
      context.go(AppRoutes.main);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).onboardingSaveUserError)));
      _scrollToPage(1);
    }
  }
}