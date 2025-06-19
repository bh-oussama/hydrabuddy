part of 'onboarding.dart';

class PageOnboardingPersonalInfo extends ConsumerStatefulWidget {
  const PageOnboardingPersonalInfo({super.key});

  @override
  ConsumerState<PageOnboardingPersonalInfo> createState() => _PageOnboardingPersonalInfoState();
}

enum _Field { age, weight, weightUnit, gender, femaleStatus }

class _PageOnboardingPersonalInfoState extends ConsumerState<PageOnboardingPersonalInfo> {
  final _formKey = GlobalKey<FormBuilderState>();
  late Gender? _selectedGender = ref.read(currentUserProvider).value?.gender;

  WeightUnit weightUnit = WeightUnit.kg;

  @override
  Widget build(BuildContext context) {
    final User? user = ref.watch(currentUserProvider).value;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: buildContinueButton(context),
      ),
      body: GestureDetector(
        onTap: UIUtils.hideKeyboard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(padding: const EdgeInsets.all(24), child: buildHeader(context)),
            Expanded(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      _buildGenderSelection(context, user: user),
                      if (_selectedGender == Gender.female) _buildFemaleStatusSelection(context, user: user),
                      _buildAgeSection(context, user: user),
                      _buildWeightSection(context, user: user),
                    ],
                  ),
                ),
              ),
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
          onPressed: _submit,
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

  Column buildHeader(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          S.current.personalInfo,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
        ),
        Text(S.current.personalInfoDescription, style: context.textTheme.bodyLarge),
      ],
    );
  }

  Widget _buildAgeSection(BuildContext context, {required User? user}) {
    return Column(
      key: ValueKey(_Field.age),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(S.current.age, style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FormBuilderTextField(
            name: _Field.age.name,
            initialValue: user?.age?.toString() ?? '',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              hintText: S.current.enterYourAge,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.current.required;
              }

              final numValue = int.tryParse(value);
              if (numValue == null || numValue < 3 || numValue > 120) {
                return S.current.invalidValue;
              }

              return null;
            },
            onSaved: (String? newValue) {
              if (newValue == null) {
                debugPrintStack(label: 'Age is null');
                return;
              }

              ref.read(currentUserProvider.notifier).setAge(int.parse(newValue));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFemaleStatusIconToggle(
    BuildContext context, {
    required FemaleStatus status,
    final String? emoji,
    required String label,
    required FormFieldState<FemaleStatus> field,
  }) {
    final bool isSelected = field.value == status;
    final Color color = isSelected ? context.colorScheme.surfaceContainerHighest : context.colorScheme.surfaceContainer;

    return GestureDetector(
      onTap: () {
        field.didChange(status);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            if (emoji != null) Text(emoji, style: const TextStyle(fontSize: 18)),
            Text(label, style: context.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildFemaleStatusSelection(BuildContext context, {required User? user}) {
    return Column(
      key: ValueKey(_Field.femaleStatus),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(
            S.current.pregnantOrBreastfeeding,
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: FormBuilderField<FemaleStatus>(
            name: _Field.femaleStatus.name,
            initialValue: user?.femaleStatus,
            validator: (FemaleStatus? value) {
              if (value == null) {
                return S.current.required;
              }

              return null;
            },
            onSaved: (FemaleStatus? newValue) {
              ref.read(currentUserProvider.notifier).setFemaleStatus(newValue);
            },
            builder: (FormFieldState<FemaleStatus> field) {
              final String? error = field.errorText;

              return Column(
                children: [
                  Wrap(
                    spacing: 2,
                    runSpacing: 2,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      _buildFemaleStatusIconToggle(
                        context,
                        status: FemaleStatus.none,
                        label: S.current.no,
                        field: field,
                      ),
                      _buildFemaleStatusIconToggle(
                        context,
                        status: FemaleStatus.pregnant,
                        label: FemaleStatus.pregnant.l10n,
                        emoji: '🤰',
                        field: field,
                      ),
                      _buildFemaleStatusIconToggle(
                        context,
                        status: FemaleStatus.breastfeeding,
                        label: FemaleStatus.breastfeeding.l10n,
                        emoji: '🍼',
                        field: field,
                      ),
                    ],
                  ),
                  if (error != null)
                    Text(error, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.error)),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGenderIconToggle(
    BuildContext context, {
    required Gender gender,
    required String emoji,
    required VoidCallback onTap,
    required Gender? selectedGender,
  }) {
    final bool isSelected = selectedGender == gender;
    final Color color = isSelected ? context.colorScheme.surfaceContainerHighest : context.colorScheme.surfaceContainer;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
          decoration: BoxDecoration(color: color, borderRadius: UIUtils.borderRadius12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Text(emoji, style: TextStyle(fontSize: 18)),
              Text(gender.l10n, style: context.textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelection(BuildContext context, {required User? user}) {
    return FormBuilderField<Gender>(
      name: _Field.gender.name,
      validator: (Gender? value) {
        if (value == null) {
          return S.current.required;
        }

        return null;
      },
      onChanged: (value) {
        setState(() {
          _selectedGender = value;
        });
      },
      onSaved: (Gender? newValue) {
        if (newValue == null) {
          return;
        }

        ref.read(currentUserProvider.notifier).setGender(newValue);
      },
      initialValue: user?.gender,
      builder: (FormFieldState<Gender> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Text(
                S.current.gender,
                style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildGenderIconToggle(
                    context,
                    gender: Gender.male,
                    emoji: '♂️',
                    selectedGender: state.value,
                    onTap: () {
                      state.didChange(Gender.male);
                    },
                  ),
                  _buildGenderIconToggle(
                    context,
                    gender: Gender.female,
                    emoji: '♀️',
                    selectedGender: state.value,
                    onTap: () {
                      state.didChange(Gender.female);
                    },
                  ),
                ],
              ),
            ),
            if (state.hasError)
              Text(state.errorText.toString(), style: context.textTheme.bodyMedium?.copyWith(color: Colors.red)),
          ],
        );
      },
    );
  }

  Widget _buildWeightSection(BuildContext context, {required User? user}) {
    final int? weightInKg = user?.weight;
    final int? weight;
    if (weightInKg == null) {
      weight = null;
    } else if (user?.weightUnit == WeightUnit.lb) {
      weight = kgToPounds(weightInKg);
    } else {
      weight = weightInKg;
    }

    return Column(
      key: ValueKey(_Field.weight),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(
            S.current.weight,
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FormBuilderTextField(
            name: _Field.weight.name,
            initialValue: weight?.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              hintText: S.current.enterYourWeight,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildWeightUnitToggle(context, initialValue: user?.weightUnit),
              ),
            ),

            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.current.required;
              }

              return null;
            },
            onSaved: (String? newValue) {
              if (newValue == null) {
                debugPrintStack(label: 'Weight is null');
                return;
              }

              final WeightUnit? weightUnit =
                  _formKey.currentState?.fields[_Field.weightUnit.name]?.value as WeightUnit?;
              if (weightUnit == null) {
                debugPrintStack(label: 'Weight unit is null');
                return;
              }

              ref.read(currentUserProvider.notifier).setWeight(int.parse(newValue), weightUnit);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeightUnitToggle(BuildContext context, {required WeightUnit? initialValue}) {
    return FormBuilderField<WeightUnit>(
      name: _Field.weightUnit.name,
      initialValue: initialValue ?? WeightUnit.kg,
      builder: (FormFieldState<WeightUnit> state) {
        return Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.colorScheme.outline, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: WeightUnit.values.map((unit) {
              final bool isSelected = state.value == unit;

              return GestureDetector(
                onTap: () {
                  state.didChange(unit);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? context.colorScheme.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    unit.l10n,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: isSelected ? context.colorScheme.onPrimary : context.colorScheme.onSurface,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
      validator: (value) {
        if (value == null) {
          return S.current.required;
        }

        return null;
      },
      onChanged: (value) {
        if (value == null) {
          debugPrintStack(label: 'Weight unit is null');
          return;
        }
        weightUnit = value;
      },
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;

    _formKey.currentState?.save();

    context.push(OnboardingPage.physicalActivity.fullPath);
  }
}
