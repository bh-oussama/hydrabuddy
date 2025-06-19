// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Insights`
  String get insights {
    return Intl.message('Insights', name: 'insights', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Good morning, {name} 👋`
  String goodMorning(String name) {
    return Intl.message(
      'Good morning, $name 👋',
      name: 'goodMorning',
      desc: '',
      args: [name],
    );
  }

  /// `Loading weather data...`
  String get loadingWeatherData {
    return Intl.message(
      'Loading weather data...',
      name: 'loadingWeatherData',
      desc: '',
      args: [],
    );
  }

  /// `Could not load weather.`
  String get couldNotLoadWeather {
    return Intl.message(
      'Could not load weather.',
      name: 'couldNotLoadWeather',
      desc: '',
      args: [],
    );
  }

  /// `Goal`
  String get goal {
    return Intl.message('Goal', name: 'goal', desc: '', args: []);
  }

  /// `Celsius`
  String get celsius {
    return Intl.message('Celsius', name: 'celsius', desc: '', args: []);
  }

  /// `C`
  String get celsiusAbbrev {
    return Intl.message('C', name: 'celsiusAbbrev', desc: '', args: []);
  }

  /// `{amount, plural, other{{amount} C} zero{0 C} one{1 C}}`
  String celsiusAmount(int amount) {
    return Intl.plural(
      amount,
      other: '$amount C',
      zero: '0 C',
      one: '1 C',
      name: 'celsiusAmount',
      desc: 'celsiusAmount',
      args: [amount],
    );
  }

  /// `Fahrenheit`
  String get fahrenheit {
    return Intl.message('Fahrenheit', name: 'fahrenheit', desc: '', args: []);
  }

  /// `F`
  String get fahrenheitAbbrev {
    return Intl.message('F', name: 'fahrenheitAbbrev', desc: '', args: []);
  }

  /// `{amount, plural, other{{amount} F} zero{0 F} one{1 F}}`
  String fahrenheitAmount(int amount) {
    return Intl.plural(
      amount,
      other: '$amount F',
      zero: '0 F',
      one: '1 F',
      name: 'fahrenheitAmount',
      desc: 'fahrenheitAmount',
      args: [amount],
    );
  }

  /// `Kg`
  String get kg {
    return Intl.message('Kg', name: 'kg', desc: '', args: []);
  }

  /// `{amount, plural, other{{amount} kg} zero{0 kg} one{1 kg}}`
  String kgAmount(int amount) {
    return Intl.plural(
      amount,
      other: '$amount kg',
      zero: '0 kg',
      one: '1 kg',
      name: 'kgAmount',
      desc: 'kg',
      args: [amount],
    );
  }

  /// `Pounds`
  String get pounds {
    return Intl.message('Pounds', name: 'pounds', desc: '', args: []);
  }

  /// `{amount, plural, other{{amount} lbs} zero{0 lb} one{1 lb}}`
  String lbAmount(int amount) {
    return Intl.plural(
      amount,
      other: '$amount lbs',
      zero: '0 lb',
      one: '1 lb',
      name: 'lbAmount',
      desc: 'lb',
      args: [amount],
    );
  }

  /// `Liter`
  String get liter {
    return Intl.message('Liter', name: 'liter', desc: '', args: []);
  }

  /// `L`
  String get literAbbrev {
    return Intl.message('L', name: 'literAbbrev', desc: '', args: []);
  }

  /// `Milliliter`
  String get milliliter {
    return Intl.message('Milliliter', name: 'milliliter', desc: '', args: []);
  }

  /// `mL`
  String get milliliterAbbrev {
    return Intl.message('mL', name: 'milliliterAbbrev', desc: '', args: []);
  }

  /// `{amount}mL`
  String amountInML(int amount) {
    final NumberFormat amountNumberFormat = NumberFormat.decimalPattern(
      Intl.getCurrentLocale(),
    );
    final String amountString = amountNumberFormat.format(amount);

    return Intl.message(
      '${amountString}mL',
      name: 'amountInML',
      desc: 'Amount in milliliters',
      args: [amountString],
    );
  }

  /// `Ounce`
  String get ounce {
    return Intl.message('Ounce', name: 'ounce', desc: '', args: []);
  }

  /// `Oz`
  String get ounceAbbrev {
    return Intl.message('Oz', name: 'ounceAbbrev', desc: '', args: []);
  }

  /// `{amount}oz`
  String amountInOunce(int amount) {
    return Intl.message(
      '${amount}oz',
      name: 'amountInOunce',
      desc: 'Amount in Ounces',
      args: [amount],
    );
  }

  /// `left today`
  String get leftToday {
    return Intl.message('left today', name: 'leftToday', desc: '', args: []);
  }

  /// `Progress`
  String get progress {
    return Intl.message('Progress', name: 'progress', desc: '', args: []);
  }

  /// `Drunk: {amount}`
  String drunkAmount(String amount) {
    return Intl.message(
      'Drunk: $amount',
      name: 'drunkAmount',
      desc: 'drunkAmount',
      args: [amount],
    );
  }

  /// `On Track`
  String get onTrack {
    return Intl.message('On Track', name: 'onTrack', desc: '', args: []);
  }

  /// `Quick Add`
  String get quickAdd {
    return Intl.message('Quick Add', name: 'quickAdd', desc: '', args: []);
  }

  /// `Required`
  String get required {
    return Intl.message('Required', name: 'required', desc: '', args: []);
  }

  /// `Invalid value`
  String get invalidValue {
    return Intl.message(
      'Invalid value',
      name: 'invalidValue',
      desc: '',
      args: [],
    );
  }

  /// `Custom Amount`
  String get customAmount {
    return Intl.message(
      'Custom Amount',
      name: 'customAmount',
      desc: '',
      args: [],
    );
  }

  /// `Enter amount`
  String get enterAmount {
    return Intl.message(
      'Enter amount',
      name: 'enterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Recent Intakes`
  String get recentIntakes {
    return Intl.message(
      'Recent Intakes',
      name: 'recentIntakes',
      desc: '',
      args: [],
    );
  }

  /// `No intakes yet`
  String get noIntakesYet {
    return Intl.message(
      'No intakes yet',
      name: 'noIntakesYet',
      desc: '',
      args: [],
    );
  }

  /// `Start tracking your water intake!`
  String get startTrackingYourWaterIntake {
    return Intl.message(
      'Start tracking your water intake!',
      name: 'startTrackingYourWaterIntake',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Week`
  String get week {
    return Intl.message('Week', name: 'week', desc: '', args: []);
  }

  /// `Month`
  String get month {
    return Intl.message('Month', name: 'month', desc: '', args: []);
  }

  /// `Your Insights`
  String get yourInsights {
    return Intl.message(
      'Your Insights',
      name: 'yourInsights',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Summary`
  String get monthlySummary {
    return Intl.message(
      'Monthly Summary',
      name: 'monthlySummary',
      desc: '',
      args: [],
    );
  }

  /// `Total Volume`
  String get totalVolume {
    return Intl.message(
      'Total Volume',
      name: 'totalVolume',
      desc: '',
      args: [],
    );
  }

  /// `Total Intakes`
  String get totalIntakes {
    return Intl.message(
      'Total Intakes',
      name: 'totalIntakes',
      desc: '',
      args: [],
    );
  }

  /// `Average Per Day`
  String get averagePerDay {
    return Intl.message(
      'Average Per Day',
      name: 'averagePerDay',
      desc: '',
      args: [],
    );
  }

  /// `Avg/Day`
  String get averagePerDayAbbreviation {
    return Intl.message(
      'Avg/Day',
      name: 'averagePerDayAbbreviation',
      desc: '',
      args: [],
    );
  }

  /// `Today's Total`
  String get todayTotal {
    return Intl.message(
      'Today\'s Total',
      name: 'todayTotal',
      desc: '',
      args: [],
    );
  }

  /// `Average Intake`
  String get averageIntake {
    return Intl.message(
      'Average Intake',
      name: 'averageIntake',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load monthly data`
  String get failedToLoadMonthlyData {
    return Intl.message(
      'Failed to load monthly data',
      name: 'failedToLoadMonthlyData',
      desc: '',
      args: [],
    );
  }

  /// `No data this month`
  String get noDataThisMonth {
    return Intl.message(
      'No data this month',
      name: 'noDataThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Start tracking to see your monthly progress!`
  String get startTrackingToSeeYourMonthlyProgress {
    return Intl.message(
      'Start tracking to see your monthly progress!',
      name: 'startTrackingToSeeYourMonthlyProgress',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load today's data`
  String get failedToLoadTodayData {
    return Intl.message(
      'Failed to load today\'s data',
      name: 'failedToLoadTodayData',
      desc: '',
      args: [],
    );
  }

  /// `No intakes today`
  String get noIntakesToday {
    return Intl.message(
      'No intakes today',
      name: 'noIntakesToday',
      desc: '',
      args: [],
    );
  }

  /// `Start tracking to see your weekly progress!`
  String get startTrackingToSeeYourWeeklyProgress {
    return Intl.message(
      'Start tracking to see your weekly progress!',
      name: 'startTrackingToSeeYourWeeklyProgress',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load weekly data`
  String get failedToLoadWeeklyData {
    return Intl.message(
      'Failed to load weekly data',
      name: 'failedToLoadWeeklyData',
      desc: '',
      args: [],
    );
  }

  /// `No data this week`
  String get noDataThisWeek {
    return Intl.message(
      'No data this week',
      name: 'noDataThisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Profile Information`
  String get profileInformation {
    return Intl.message(
      'Profile Information',
      name: 'profileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Your name helps personalize your experience.`
  String get yourNameHelpsPersonalizeYourExperience {
    return Intl.message(
      'Your name helps personalize your experience.',
      name: 'yourNameHelpsPersonalizeYourExperience',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid age`
  String get pleaseEnterAValidAge {
    return Intl.message(
      'Please enter a valid age',
      name: 'pleaseEnterAValidAge',
      desc: '',
      args: [],
    );
  }

  /// `For accurate hydration advice.`
  String get forAccurateHydrationAdvice {
    return Intl.message(
      'For accurate hydration advice.',
      name: 'forAccurateHydrationAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Used to calculate your daily intake.`
  String get usedToCalculateYourDailyIntake {
    return Intl.message(
      'Used to calculate your daily intake.',
      name: 'usedToCalculateYourDailyIntake',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Female Status`
  String get femaleStatus {
    return Intl.message(
      'Female Status',
      name: 'femaleStatus',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `Gender helps tailor hydration recommendations.`
  String get genderHelpsTailorHydrationRecommendations {
    return Intl.message(
      'Gender helps tailor hydration recommendations.',
      name: 'genderHelpsTailorHydrationRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `Female status helps tailor hydration recommendations.`
  String get femaleStatusHelpsTailorHydrationRecommendations {
    return Intl.message(
      'Female status helps tailor hydration recommendations.',
      name: 'femaleStatusHelpsTailorHydrationRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid weight`
  String get pleaseEnterAValidWeight {
    return Intl.message(
      'Please enter a valid weight',
      name: 'pleaseEnterAValidWeight',
      desc: '',
      args: [],
    );
  }

  /// `Save Settings`
  String get saveSettings {
    return Intl.message(
      'Save Settings',
      name: 'saveSettings',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Switch between light and dark themes`
  String get switchBetweenLightAndDarkThemes {
    return Intl.message(
      'Switch between light and dark themes',
      name: 'switchBetweenLightAndDarkThemes',
      desc: '',
      args: [],
    );
  }

  /// `No custom volumes`
  String get noCustomVolumes {
    return Intl.message(
      'No custom volumes',
      name: 'noCustomVolumes',
      desc: '',
      args: [],
    );
  }

  /// `Add your preferred intake volumes`
  String get addYourPreferredIntakeVolumes {
    return Intl.message(
      'Add your preferred intake volumes',
      name: 'addYourPreferredIntakeVolumes',
      desc: '',
      args: [],
    );
  }

  /// `Add New Volume`
  String get addNewVolume {
    return Intl.message(
      'Add New Volume',
      name: 'addNewVolume',
      desc: '',
      args: [],
    );
  }

  /// `Edit Volume {name}`
  String editVolume(String name) {
    return Intl.message(
      'Edit Volume $name',
      name: 'editVolume',
      desc: 'editVolume',
      args: [name],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Settings saved successfully!`
  String get settingsSavedSuccessfully {
    return Intl.message(
      'Settings saved successfully!',
      name: 'settingsSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Volume deleted`
  String get volumeDeleted {
    return Intl.message(
      'Volume deleted',
      name: 'volumeDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Name (e.g., Coffee Cup)`
  String get namePlaceholder {
    return Intl.message(
      'Name (e.g., Coffee Cup)',
      name: 'namePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Volume (mL)`
  String get volumeMilliliterPlaceholder {
    return Intl.message(
      'Volume (mL)',
      name: 'volumeMilliliterPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Volume (Oz)`
  String get volumeOuncePlaceholder {
    return Intl.message(
      'Volume (Oz)',
      name: 'volumeOuncePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Physical Activity Level`
  String get physicalActivityLevel {
    return Intl.message(
      'Physical Activity Level',
      name: 'physicalActivityLevel',
      desc: '',
      args: [],
    );
  }

  /// `Weight Unit`
  String get weightUnit {
    return Intl.message('Weight Unit', name: 'weightUnit', desc: '', args: []);
  }

  /// `Volume Unit`
  String get volumeUnit {
    return Intl.message('Volume Unit', name: 'volumeUnit', desc: '', args: []);
  }

  /// `Temperature Unit`
  String get temperatureUnit {
    return Intl.message(
      'Temperature Unit',
      name: 'temperatureUnit',
      desc: '',
      args: [],
    );
  }

  /// `Health Status`
  String get healthStatus {
    return Intl.message(
      'Health Status',
      name: 'healthStatus',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message('Preferences', name: 'preferences', desc: '', args: []);
  }

  /// `Quick Add Volumes`
  String get quickAddVolumes {
    return Intl.message(
      'Quick Add Volumes',
      name: 'quickAddVolumes',
      desc: '',
      args: [],
    );
  }

  /// `Configure your preferred intake volumes for quick access`
  String get configureYourPreferredIntakeVolumesForQuickAccess {
    return Intl.message(
      'Configure your preferred intake volumes for quick access',
      name: 'configureYourPreferredIntakeVolumesForQuickAccess',
      desc: '',
      args: [],
    );
  }

  /// `Select your current health status for more accurate hydration recommendations`
  String
  get selectYourCurrentHealthStatusForMoreAccurateHydrationRecommendations {
    return Intl.message(
      'Select your current health status for more accurate hydration recommendations',
      name:
          'selectYourCurrentHealthStatusForMoreAccurateHydrationRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `How active are you on a typical day?`
  String get howActiveAreYouOnATypicalDay {
    return Intl.message(
      'How active are you on a typical day?',
      name: 'howActiveAreYouOnATypicalDay',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred weight unit.`
  String get chooseYourPreferredWeightUnit {
    return Intl.message(
      'Choose your preferred weight unit.',
      name: 'chooseYourPreferredWeightUnit',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred volume unit.`
  String get chooseYourPreferredVolumeUnit {
    return Intl.message(
      'Choose your preferred volume unit.',
      name: 'chooseYourPreferredVolumeUnit',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred temperature unit.`
  String get chooseYourPreferredTemperatureUnit {
    return Intl.message(
      'Choose your preferred temperature unit.',
      name: 'chooseYourPreferredTemperatureUnit',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Progress`
  String get weeklyProgress {
    return Intl.message(
      'Weekly Progress',
      name: 'weeklyProgress',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Progress`
  String get monthlyProgress {
    return Intl.message(
      'Monthly Progress',
      name: 'monthlyProgress',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter name`
  String get enterName {
    return Intl.message('Enter name', name: 'enterName', desc: '', args: []);
  }

  /// `Enter volume`
  String get enterVolume {
    return Intl.message(
      'Enter volume',
      name: 'enterVolume',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInfo {
    return Intl.message(
      'Personal Information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Help us personalize your hydration experience`
  String get personalInfoDescription {
    return Intl.message(
      'Help us personalize your hydration experience',
      name: 'personalInfoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `Are you pregnant or breastfeeding?`
  String get pregnantOrBreastfeeding {
    return Intl.message(
      'Are you pregnant or breastfeeding?',
      name: 'pregnantOrBreastfeeding',
      desc: '',
      args: [],
    );
  }

  /// `Pregnant`
  String get pregnant {
    return Intl.message('Pregnant', name: 'pregnant', desc: '', args: []);
  }

  /// `Breastfeeding`
  String get breastfeeding {
    return Intl.message(
      'Breastfeeding',
      name: 'breastfeeding',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message('None', name: 'none', desc: '', args: []);
  }

  /// `Enter your age`
  String get enterYourAge {
    return Intl.message(
      'Enter your age',
      name: 'enterYourAge',
      desc: '',
      args: [],
    );
  }

  /// `Enter your weight`
  String get enterYourWeight {
    return Intl.message(
      'Enter your weight',
      name: 'enterYourWeight',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `What should I call you?`
  String get whatShouldICallYou {
    return Intl.message(
      'What should I call you?',
      name: 'whatShouldICallYou',
      desc: '',
      args: [],
    );
  }

  /// `What is your physical activity level?`
  String get whatIsYourPhysicalActivityLevel {
    return Intl.message(
      'What is your physical activity level?',
      name: 'whatIsYourPhysicalActivityLevel',
      desc: '',
      args: [],
    );
  }

  /// `Please select a level that matches your daily routine`
  String get pleaseSelectALevelThatMatchesYourDailyRoutine {
    return Intl.message(
      'Please select a level that matches your daily routine',
      name: 'pleaseSelectALevelThatMatchesYourDailyRoutine',
      desc: '',
      args: [],
    );
  }

  /// `Allow localization`
  String get allowLocalization {
    return Intl.message(
      'Allow localization',
      name: 'allowLocalization',
      desc: '',
      args: [],
    );
  }

  /// `A hot weather = drinking more water`
  String get allowLocalizationDescription1 {
    return Intl.message(
      'A hot weather = drinking more water',
      name: 'allowLocalizationDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Letting me access location would allow me to check weather status and update water intake objectives accordingly!`
  String get allowLocalizationDescription2 {
    return Intl.message(
      'Letting me access location would allow me to check weather status and update water intake objectives accordingly!',
      name: 'allowLocalizationDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Localization permissions are not granted.`
  String get allowLocalizationFailed {
    return Intl.message(
      'Localization permissions are not granted.',
      name: 'allowLocalizationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please allow localization!`
  String get allowLocalizationPleaseAllow {
    return Intl.message(
      'Please allow localization!',
      name: 'allowLocalizationPleaseAllow',
      desc: '',
      args: [],
    );
  }

  /// `Track Water Intake`
  String get trackWaterIntake {
    return Intl.message(
      'Track Water Intake',
      name: 'trackWaterIntake',
      desc: '',
      args: [],
    );
  }

  /// `You are all set to start tracking your water intake and stay hydrated!`
  String get readyDescription {
    return Intl.message(
      'You are all set to start tracking your water intake and stay hydrated!',
      name: 'readyDescription',
      desc: '',
      args: [],
    );
  }

  /// `You're all set!`
  String get readyHeadline {
    return Intl.message(
      'You\'re all set!',
      name: 'readyHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Staying hydrated boosts your energy and focus!`
  String get readyMotivation {
    return Intl.message(
      'Staying hydrated boosts your energy and focus!',
      name: 'readyMotivation',
      desc: '',
      args: [],
    );
  }

  /// `Glass of Water`
  String get glassOfWater {
    return Intl.message(
      'Glass of Water',
      name: 'glassOfWater',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Please try again`
  String get pleaseTryAgain {
    return Intl.message(
      'Please try again',
      name: 'pleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Could not load user data`
  String get couldNotLoadUserData {
    return Intl.message(
      'Could not load user data',
      name: 'couldNotLoadUserData',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load weather data. Please try again!`
  String get failedToLoadWeatherData {
    return Intl.message(
      'Failed to load weather data. Please try again!',
      name: 'failedToLoadWeatherData',
      desc: '',
      args: [],
    );
  }

  /// `Select an icon`
  String get selectAnIcon {
    return Intl.message(
      'Select an icon',
      name: 'selectAnIcon',
      desc: '',
      args: [],
    );
  }

  /// `Failed to calculate water intake goal`
  String get failedToCalculateWaterIntakeGoal {
    return Intl.message(
      'Failed to calculate water intake goal',
      name: 'failedToCalculateWaterIntakeGoal',
      desc: '',
      args: [],
    );
  }

  /// `Remaining: {value}`
  String remainingValue(String value) {
    return Intl.message(
      'Remaining: $value',
      name: 'remainingValue',
      desc: 'remainingValue',
      args: [value],
    );
  }

  /// `Goal reached`
  String get goalReached {
    return Intl.message(
      'Goal reached',
      name: 'goalReached',
      desc: '',
      args: [],
    );
  }

  /// `+{value}mL`
  String extraIntakeInMilliliter(int value) {
    return Intl.message(
      '+${value}mL',
      name: 'extraIntakeInMilliliter',
      desc: 'extraIntakeInMilliliter',
      args: [value],
    );
  }

  /// `+{value}Oz`
  String extraIntakeInOunce(int value) {
    return Intl.message(
      '+${value}Oz',
      name: 'extraIntakeInOunce',
      desc: 'extraIntakeInOunce',
      args: [value],
    );
  }

  /// `Illness`
  String get illness {
    return Intl.message('Illness', name: 'illness', desc: '', args: []);
  }

  /// `Heart Disease`
  String get heartDisease {
    return Intl.message(
      'Heart Disease',
      name: 'heartDisease',
      desc: '',
      args: [],
    );
  }

  /// `Diabetes`
  String get diabetes {
    return Intl.message('Diabetes', name: 'diabetes', desc: '', args: []);
  }

  /// `Fever or Diarrhea`
  String get feverOrDiarrhea {
    return Intl.message(
      'Fever or Diarrhea',
      name: 'feverOrDiarrhea',
      desc: '',
      args: [],
    );
  }

  /// `Healthy`
  String get healthy {
    return Intl.message('Healthy', name: 'healthy', desc: '', args: []);
  }

  /// `Tell me about your current health so I can support your hydration journey.`
  String get healthStatusDescription {
    return Intl.message(
      'Tell me about your current health so I can support your hydration journey.',
      name: 'healthStatusDescription',
      desc: '',
      args: [],
    );
  }

  /// `Please select your health status`
  String get pleaseSelectHealthStatus {
    return Intl.message(
      'Please select your health status',
      name: 'pleaseSelectHealthStatus',
      desc: '',
      args: [],
    );
  }

  /// `Goal met!`
  String get goalMet {
    return Intl.message('Goal met!', name: 'goalMet', desc: '', args: []);
  }

  /// `Left to goal: {value}`
  String leftToGoal(String value) {
    return Intl.message(
      'Left to goal: $value',
      name: 'leftToGoal',
      desc: 'leftToGoal',
      args: [value],
    );
  }

  /// `Today's Intakes`
  String get todayIntakes {
    return Intl.message(
      'Today\'s Intakes',
      name: 'todayIntakes',
      desc: '',
      args: [],
    );
  }

  /// `Great job! You've reached your goal today.`
  String get greatJobGoalReached {
    return Intl.message(
      'Great job! You\'ve reached your goal today.',
      name: 'greatJobGoalReached',
      desc: '',
      args: [],
    );
  }

  /// `Keep going! Stay hydrated and reach your goal.`
  String get keepGoingGoalNotReached {
    return Intl.message(
      'Keep going! Stay hydrated and reach your goal.',
      name: 'keepGoingGoalNotReached',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, other{{count} hours} zero{0 hours} one{1 hour}}`
  String xHours(int count) {
    return Intl.plural(
      count,
      other: '$count hours',
      zero: '0 hours',
      one: '1 hour',
      name: 'xHours',
      desc: 'X hours',
      args: [count],
    );
  }

  /// `{count, plural, other{{count} minutes} zero{0 minutes} one{1 minute}}`
  String xMinutes(int count) {
    return Intl.plural(
      count,
      other: '$count minutes',
      zero: '0 minutes',
      one: '1 minute',
      name: 'xMinutes',
      desc: 'X minutes',
      args: [count],
    );
  }

  /// `Last Intake: {time} ago`
  String lastIntakeSince(String time) {
    return Intl.message(
      'Last Intake: $time ago',
      name: 'lastIntakeSince',
      desc: 'Last intake since',
      args: [time],
    );
  }

  /// `Sedentary`
  String get sedentary {
    return Intl.message('Sedentary', name: 'sedentary', desc: '', args: []);
  }

  /// `Mostly sitting throughout the day with little to no physical activity.`
  String get sedentaryDescription {
    return Intl.message(
      'Mostly sitting throughout the day with little to no physical activity.',
      name: 'sedentaryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `Occasional movement like walking or standing but no structured exercise.`
  String get lightDescription {
    return Intl.message(
      'Occasional movement like walking or standing but no structured exercise.',
      name: 'lightDescription',
      desc: '',
      args: [],
    );
  }

  /// `Moderate`
  String get moderate {
    return Intl.message('Moderate', name: 'moderate', desc: '', args: []);
  }

  /// `Regular movement including some workouts or an active lifestyle.`
  String get moderateDescription {
    return Intl.message(
      'Regular movement including some workouts or an active lifestyle.',
      name: 'moderateDescription',
      desc: '',
      args: [],
    );
  }

  /// `Highly Active`
  String get highlyActive {
    return Intl.message(
      'Highly Active',
      name: 'highlyActive',
      desc: '',
      args: [],
    );
  }

  /// `Consistent physical effort with intense exercise or physically demanding work.`
  String get highlyActiveDescription {
    return Intl.message(
      'Consistent physical effort with intense exercise or physically demanding work.',
      name: 'highlyActiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `Extremely Active`
  String get extremelyActive {
    return Intl.message(
      'Extremely Active',
      name: 'extremelyActive',
      desc: '',
      args: [],
    );
  }

  /// `Intense daily workouts or physically demanding job requiring high endurance.`
  String get extremelyActiveDescription {
    return Intl.message(
      'Intense daily workouts or physically demanding job requiring high endurance.',
      name: 'extremelyActiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `This Week`
  String get thisWeek {
    return Intl.message('This Week', name: 'thisWeek', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Goal Met on Days`
  String get goalMetOnDays {
    return Intl.message(
      'Goal Met on Days',
      name: 'goalMetOnDays',
      desc: '',
      args: [],
    );
  }

  /// `Best Streak`
  String get bestStreak {
    return Intl.message('Best Streak', name: 'bestStreak', desc: '', args: []);
  }

  /// `{value} compared to last week`
  String compareToLastWeek(Object value) {
    return Intl.message(
      '$value compared to last week',
      name: 'compareToLastWeek',
      desc: '',
      args: [value],
    );
  }

  /// `{count, plural, zero{Goal was not met} one{Met Goal on 1 day} other{Met Goal on {count} days}}`
  String metGoalOnDays(int count) {
    return Intl.plural(
      count,
      zero: 'Goal was not met',
      one: 'Met Goal on 1 day',
      other: 'Met Goal on $count days',
      name: 'metGoalOnDays',
      desc: 'metGoalOnDays',
      args: [count],
    );
  }

  /// `Stay hydrated! Try to hit your daily goal more often.`
  String get stayHydrated {
    return Intl.message(
      'Stay hydrated! Try to hit your daily goal more often.',
      name: 'stayHydrated',
      desc: '',
      args: [],
    );
  }

  /// `compared to yesterday`
  String get comparedToYesterday {
    return Intl.message(
      'compared to yesterday',
      name: 'comparedToYesterday',
      desc: '',
      args: [],
    );
  }

  /// `This Month`
  String get thisMonth {
    return Intl.message('This Month', name: 'thisMonth', desc: '', args: []);
  }

  /// `Partial`
  String get partial {
    return Intl.message('Partial', name: 'partial', desc: '', args: []);
  }

  /// `Customize your hydration experience`
  String get customizeYourHydrationExperience {
    return Intl.message(
      'Customize your hydration experience',
      name: 'customizeYourHydrationExperience',
      desc: '',
      args: [],
    );
  }

  /// `Stay hydrated and track your water intake effortlessly. Let’s build a healthier habit together!`
  String get getStartedCaption {
    return Intl.message(
      'Stay hydrated and track your water intake effortlessly. Let’s build a healthier habit together!',
      name: 'getStartedCaption',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Theme Mode`
  String get themeMode {
    return Intl.message('Theme Mode', name: 'themeMode', desc: '', args: []);
  }

  /// `Choose your preferred theme appearance`
  String get chooseYourPreferredThemeAppearance {
    return Intl.message(
      'Choose your preferred theme appearance',
      name: 'chooseYourPreferredThemeAppearance',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, {name}`
  String welcomeX(String name) {
    return Intl.message(
      'Welcome, $name',
      name: 'welcomeX',
      desc: 'welcomeX',
      args: [name],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Best: {day} with {value}`
  String bestDayWithValue(DateTime day, double value) {
    final DateFormat dayDateFormat = DateFormat.EEEE(Intl.getCurrentLocale());
    final String dayString = dayDateFormat.format(day);

    final NumberFormat valueNumberFormat = NumberFormat.percentPattern(
      Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      'Best: $dayString with $valueString',
      name: 'bestDayWithValue',
      desc: 'bestDayWithValue',
      args: [dayString, valueString],
    );
  }

  /// `Lowest: {day} with {value}`
  String lowestDayWithValue(DateTime day, double value) {
    final DateFormat dayDateFormat = DateFormat.EEEE(Intl.getCurrentLocale());
    final String dayString = dayDateFormat.format(day);

    final NumberFormat valueNumberFormat = NumberFormat.percentPattern(
      Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      'Lowest: $dayString with $valueString',
      name: 'lowestDayWithValue',
      desc: 'lowestDayWithValue',
      args: [dayString, valueString],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
