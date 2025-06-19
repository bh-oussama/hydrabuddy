part of 'onboarding.dart';

class PageOnboardingGetStarted extends StatefulWidget {
  const PageOnboardingGetStarted({super.key});

  @override
  State<PageOnboardingGetStarted> createState() => _PageOnboardingGetStartedState();
}

class _PageOnboardingGetStartedState extends State<PageOnboardingGetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 56,
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 32 + MediaQuery.of(context).padding.bottom),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () {
            context.push(OnboardingPage.nameInput.fullPath);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                S.current.getStarted,
                style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onPrimary),
              ),
              Icon(Icons.chevron_right_rounded, color: context.colorScheme.onPrimary),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('💧', style: TextStyle(fontSize: 56)),
              const SizedBox(height: 24),
              Text('HydrationBuddy', style: context.textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: 16),
              Text(S.current.getStartedCaption, style: context.textTheme.titleMedium, textAlign: TextAlign.center),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    UIUtils.hideKeyboard();
  }
}
