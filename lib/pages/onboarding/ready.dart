part of 'onboarding.dart';

class PageOnboardingReady extends StatelessWidget {
  const PageOnboardingReady({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: buildContinueButton(context),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 24, left: 24, top: 64 + MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: SizedBox(height: 120, child: Image.asset('icons/bottle-3-cup.png')),
            ),
            Text(
              S.current.readyHeadline,
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(S.current.readyDescription, style: context.textTheme.titleLarge, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Text(
              S.current.readyMotivation,
              style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.secondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContinueButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.go('/home');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
            elevation: 0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.water_drop_rounded, color: context.colorScheme.onPrimary),
              const SizedBox(width: 8),
              Text(
                S.current.trackWaterIntake,
                style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
