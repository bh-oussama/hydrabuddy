part of 'onboarding.dart';

class PageOnboardingPhysicalActivity extends ConsumerStatefulWidget {
  const PageOnboardingPhysicalActivity({super.key});

  @override
  ConsumerState<PageOnboardingPhysicalActivity> createState() => _PageOnboardingPhysicalActivityState();
}

class _PageOnboardingPhysicalActivityState extends ConsumerState<PageOnboardingPhysicalActivity> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    UIUtils.hideKeyboard();

    final mq = MediaQuery.of(context);

    final User? user = ref.watch(currentUserProvider).value;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: mq.padding.bottom),
        child: _buildContinueButton(context),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 24, left: 24, top: 64 + mq.padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text(S.current.whatIsYourPhysicalActivityLevel, style: context.textTheme.headlineLarge),

            Expanded(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: FormBuilderRadioGroup(
                    name: 'activity',
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    initialValue: user?.physicalActivityLevel,
                    controlAffinity: ControlAffinity.trailing,
                    options: PhysicalActivityLevel.values
                        .map((value) {
                          return FormBuilderFieldOption(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: RichText(
                                text: TextSpan(
                                  text: value.l10n,
                                  style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: '\n', spellOut: false),
                                    TextSpan(text: value.description, style: context.textTheme.titleMedium),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                        .toList(growable: false),
                    validator: (value) {
                      if (value == null) {
                        return S.current.pleaseSelectALevelThatMatchesYourDailyRoutine;
                      }

                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue == null) {
                        return;
                      }

                      ref.read(currentUserProvider.notifier).setPhysicalActivityLevel(newValue);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            assert(_formKey.currentState != null);
            if (_formKey.currentState?.validate() != true) {
              return;
            }

            _formKey.currentState?.save();

            context.push(OnboardingPage.location.fullPath);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.primary,
            foregroundColor: context.colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
            elevation: 0,
          ),
          child: Text(
            S.current.continueText,
            style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
