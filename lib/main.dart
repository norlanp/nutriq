import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import 'package:nutriq/core/router/app_router.dart';
import 'package:nutriq/core/styles/color_schemes.dart';
import 'package:nutriq/core/styles/fonts.dart';
import 'package:nutriq/core/utils/env.dart';
import 'package:nutriq/core/utils/logger_config.dart';

import 'package:home_widget/home_widget.dart';
import 'package:nutriq/generated/l10n.dart';
import 'package:nutriq/core/providers/data_source_providers.dart';
import 'package:nutriq/core/providers/database_provider.dart';
import 'package:nutriq/core/providers/notifier_providers.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/core/utils/app_reporter.dart';
import 'package:nutriq/core/utils/background_task_scheduler.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    LoggerConfig.initLogger();
    final log = Logger('main');

    final container = ProviderContainer();
    await container.read(appInitializerProvider);

    final hasAcceptedAnonymousData =
        await container.read(configRepositoryProvider).getConfigHasAcceptedAnonymousData();

    FlutterError.onError = (details) {
      log.severe('FlutterError', details.exception, details.stack);
      FlutterError.presentError(details);
    };

    try {
      await HomeWidget.setAppGroupId('group.com.nutriq.app');
    } catch (e) {
      log.warning('Failed to set HomeWidget group ID: $e');
    }

    await BackgroundTaskScheduler.init();

    final isUserInitialized = await container.read(userDataSourceProvider).hasUserData();
    final savedAppTheme = await container.read(configRepositoryProvider).getConfigAppTheme();

    container.read(themeModeProvider.notifier).initFromSaved(savedAppTheme);

    if (kReleaseMode && hasAcceptedAnonymousData) {
      log.info('Starting App with Sentry enabled ...');
      await AppReporter.init(Env.sentryDns);
      runAppWithChangeNotifiers(isUserInitialized, container);
    } else {
      log.info('Starting App ...');
      runAppWithChangeNotifiers(isUserInitialized, container);
    }
  }, (error, stack) {
    final log = Logger('main');
    log.severe('UNCAUGHT ERROR', error, stack);
  });
}

void runAppWithChangeNotifiers(
        bool userInitialized,
        [ProviderContainer? container]) =>
    runApp(UncontrolledProviderScope(
        container: container ?? ProviderContainer(),
        child: NutriqApp(userInitialized: userInitialized)));

class NutriqApp extends ConsumerWidget {
  final bool userInitialized;

  const NutriqApp({super.key, required this.userInitialized});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final platformLocale = ui.PlatformDispatcher.instance.locale;
    final locale = (platformLocale.languageCode == 'undefined' ||
            platformLocale.toString() == 'undefined')
        ? const Locale('en')
        : platformLocale;
    final router = createAppRouter(userInitialized: userInitialized);
    return MaterialApp.router(
      routerConfig: router,
      locale: locale,
      onGenerateTitle: (context) => S.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: appTextTheme),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: appTextTheme),
      themeMode: themeMode,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (locale, supported) {
        if (locale == null ||
            locale.languageCode == 'undefined' ||
            locale.toString() == 'undefined') {
          return const Locale('en');
        }
        for (final supportedLocale in supported) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return const Locale('en');
      },
    );
  }
}