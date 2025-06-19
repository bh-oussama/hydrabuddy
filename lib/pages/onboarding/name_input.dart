part of 'onboarding.dart';

class PageOnboardingNameInput extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  PageOnboardingNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return GestureDetector(
      onTap: UIUtils.hideKeyboard,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: mq.padding.bottom),
          child: _buildContinueButton(context),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 64 + mq.padding.top, bottom: mq.padding.bottom),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    const Text('👋', style: TextStyle(fontSize: 32)),
                    Text(S.current.whatShouldICallYou, style: context.textTheme.headlineLarge),
                  ],
                ),
                const SizedBox(height: 12),
                Text(S.current.personalInfoDescription, style: context.textTheme.bodyLarge),
                const SizedBox(height: 32),
                _buildInputField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildContinueButton(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colorScheme.primary,
          foregroundColor: context.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () => _submit(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.current.continueText,
              style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onPrimary),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right_rounded, color: context.colorScheme.onPrimary),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Consumer(
      builder: (context, ref, _) {
        return FormBuilderTextField(
          name: 'name',
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          initialValue: ref.watch(currentUserProvider).whenData((user) => user?.name).value,
          decoration: InputDecoration(
            hintText: S.current.enterYourName,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          maxLines: 1,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.current.required;
            }

            return null;
          },
          onSaved: (String? newValue) {
            final String? value = newValue?.trim();
            if (value == null || value.isEmpty) {
              return;
            }

            ref.read(currentUserProvider.notifier).setName(value);
          },
          textInputAction: TextInputAction.next,
          onSubmitted: (value) {
            _submit(context);
          },
        );
      },
    );
  }

  void _submit(BuildContext context) {
    assert(_formKey.currentState != null);
    if (_formKey.currentState?.validate() != true) return;
    FocusScope.of(context).unfocus();

    _formKey.currentState?.save();

    context.push(OnboardingPage.personalInfo.fullPath);
  }
}
