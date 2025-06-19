part of 'onboarding.dart';

class PageOnboardingLocation extends ConsumerStatefulWidget {
  const PageOnboardingLocation({super.key});

  @override
  ConsumerState<PageOnboardingLocation> createState() => _PageOnboardingLocationState();
}

class _PageOnboardingLocationState extends ConsumerState<PageOnboardingLocation> {
  bool enablingLocalizationFailed = false;
  bool enablingLocalization = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: mq.padding.bottom),
        child: _buildContinueButton(context),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 64 + mq.padding.top, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: S.current.allowLocalizationDescription1,
                children: [
                  TextSpan(text: '\n'),
                  TextSpan(text: S.current.allowLocalizationDescription2, style: context.textTheme.headlineSmall),
                ],
                style: context.textTheme.headlineLarge,
              ),
            ),
            const Spacer(),
            if (enablingLocalizationFailed)
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: S.current.allowLocalizationFailed,
                    style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.error),
                    children: [
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: S.current.allowLocalizationPleaseAllow,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> enableLocalization(BuildContext context) async {
    setState(() {
      enablingLocalization = true;
    });

    try {
      final GPSCoordinates? coordinates = await ref.watch(locationProvider.future);

      if (coordinates == null) {
        setState(() {
          enablingLocalizationFailed = true;
        });
        return;
      }

      if (context.mounted) {
        context.go(OnboardingPage.ready.fullPath);
      }
    } finally {
      setState(() {
        enablingLocalization = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    UIUtils.hideKeyboard();
  }

  Widget _buildContinueButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: enablingLocalization ? null : () => enableLocalization(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.primary,
            foregroundColor: context.colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
            elevation: 0,
          ),
          child: enablingLocalization
              ? AspectRatio(aspectRatio: 1, child: CircularProgressIndicator.adaptive())
              : Text(
                  S.current.allowLocalization,
                  style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onPrimary),
                ),
        ),
      ),
    );
  }
}
