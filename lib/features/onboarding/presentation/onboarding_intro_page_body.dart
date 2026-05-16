import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/presentation/widgets/app_banner_version.dart';
import 'package:nutriq/core/utils/app_const.dart';
import 'package:nutriq/core/utils/url_const.dart';
import 'package:nutriq/features/onboarding/presentation/notifier/onboarding_form_notifier.dart';
import 'package:nutriq/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingIntroPageBody extends ConsumerStatefulWidget {
  const OnboardingIntroPageBody({super.key});

  @override
  ConsumerState<OnboardingIntroPageBody> createState() =>
      _OnboardingIntroPageBodyState();
}

class _OnboardingIntroPageBodyState
    extends ConsumerState<OnboardingIntroPageBody> {
  @override
  Widget build(BuildContext context) {
    final form = ref.watch(onboardingFormProvider);
    return FutureBuilder(
      future: AppConst.getVersionNumber(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              AppBannerVersion(
                versionNumber: snapshot.requireData,
              ),
              const SizedBox(height: 32.0),
              Text(S.of(context).appDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: 32.0),
              Text(
                S.of(context).onboardingIntroDescription,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              ListTile(
                onTap: () => _togglePolicy(),
                title: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        text: S.of(context).readLabel,
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                              text: ' ${S.of(context).privacyPolicyLabel}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _launchUrl();
                                }),
                        ])),
                leading: Checkbox(
                  value: form.privacyAccepted.value,
                  onChanged: (value) {
                    if (value != null) {
                      _togglePolicy();
                    }
                  },
                ),
              ),
              ListTile(
                onTap: () => _toggleDataCollection(),
                title: Text(S.of(context).dataCollectionLabel,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall),
                leading: Checkbox(
                  value: form.acceptDataCollection,
                  onChanged: (_) => _toggleDataCollection(),
                ),
              )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  void _togglePolicy() {
    final current = ref.read(onboardingFormProvider).privacyAccepted;
    ref
        .read(onboardingFormProvider.notifier)
        .privacyAcceptedChanged(!current.value);
  }

  void _toggleDataCollection() {
    final current = ref.read(onboardingFormProvider).acceptDataCollection;
    ref
        .read(onboardingFormProvider.notifier)
        .dataCollectionAcceptedChanged(!current);
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(URLConst.privacyPolicyURLEn),
        mode: LaunchMode.externalApplication)) {}
  }
}