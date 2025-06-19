// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get insights => 'Insights';

  @override
  String get settings => 'Settings';

  @override
  String goodMorning({required String name}) {
    return 'Good morning, $name 👋';
  }

  @override
  String get loadingWeatherData => 'Loading weather data...';

  @override
  String get couldNotLoadWeather => 'Could not load weather.';

  @override
  String get goal => 'Goal';

  @override
  String get celsius => 'Celsius';

  @override
  String get celsiusAbbrev => 'C';

  @override
  String celsiusAmount({required int amount}) {
    String _temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      one: '1 C',
      zero: '0 C',
      other: '$amount C',
    );
    return '$_temp0';
  }

  @override
  String get fahrenheit => 'Fahrenheit';

  @override
  String get fahrenheitAbbrev => 'F';

  @override
  String fahrenheitAmount({required int amount}) {
    String _temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      one: '1 F',
      zero: '0 F',
      other: '$amount F',
    );
    return '$_temp0';
  }

  @override
  String get kg => 'Kg';

  @override
  String kgAmount({required int amount}) {
    String _temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      one: '1 kg',
      zero: '0 kg',
      other: '$amount kg',
    );
    return '$_temp0';
  }

  @override
  String get pounds => 'Pounds';

  @override
  String lbAmount({required int amount}) {
    String _temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      one: '1 lb',
      zero: '0 lb',
      other: '$amount lbs',
    );
    return '$_temp0';
  }

  @override
  String get liter => 'Liter';

  @override
  String get literAbbrev => 'L';

  @override
  String get milliliter => 'Milliliter';

  @override
  String get milliliterAbbrev => 'mL';

  @override
  String amountInML({required int amount}) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '${amountString}mL';
  }

  @override
  String get ounce => 'Ounce';

  @override
  String get ounceAbbrev => 'Oz';

  @override
  String amountInOunce({required int amount}) {
    return '${amount}oz';
  }

  @override
  String get leftToday => 'left today';

  @override
  String get progress => 'Progress';

  @override
  String drunkAmount({required String amount}) {
    return 'Drunk: $amount';
  }

  @override
  String get onTrack => 'On Track';

  @override
  String get quickAdd => 'Quick Add';

  @override
  String get required => 'Required';

  @override
  String get invalidValue => 'Invalid value';

  @override
  String get customAmount => 'Custom Amount';

  @override
  String get enterAmount => 'Enter amount';

  @override
  String get recentIntakes => 'Recent Intakes';

  @override
  String get noIntakesYet => 'No intakes yet';

  @override
  String get startTrackingYourWaterIntake =>
      'Start tracking your water intake!';

  @override
  String get today => 'Today';

  @override
  String get week => 'Week';

  @override
  String get month => 'Month';

  @override
  String get yourInsights => 'Your Insights';

  @override
  String get monthlySummary => 'Monthly Summary';

  @override
  String get totalVolume => 'Total Volume';

  @override
  String get totalIntakes => 'Total Intakes';

  @override
  String get averagePerDay => 'Average Per Day';

  @override
  String get averagePerDayAbbreviation => 'Avg/Day';

  @override
  String get todayTotal => 'Today\'s Total';

  @override
  String get averageIntake => 'Average Intake';

  @override
  String get failedToLoadMonthlyData => 'Failed to load monthly data';

  @override
  String get noDataThisMonth => 'No data this month';

  @override
  String get startTrackingToSeeYourMonthlyProgress =>
      'Start tracking to see your monthly progress!';

  @override
  String get failedToLoadTodayData => 'Failed to load today\'s data';

  @override
  String get noIntakesToday => 'No intakes today';

  @override
  String get startTrackingToSeeYourWeeklyProgress =>
      'Start tracking to see your weekly progress!';

  @override
  String get failedToLoadWeeklyData => 'Failed to load weekly data';

  @override
  String get noDataThisWeek => 'No data this week';

  @override
  String get profileInformation => 'Profile Information';

  @override
  String get name => 'Name';

  @override
  String get age => 'Age';

  @override
  String get yourNameHelpsPersonalizeYourExperience =>
      'Your name helps personalize your experience.';

  @override
  String get pleaseEnterAValidAge => 'Please enter a valid age';

  @override
  String get forAccurateHydrationAdvice => 'For accurate hydration advice.';

  @override
  String get usedToCalculateYourDailyIntake =>
      'Used to calculate your daily intake.';

  @override
  String get gender => 'Gender';

  @override
  String get femaleStatus => 'Female Status';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get weight => 'Weight';

  @override
  String get genderHelpsTailorHydrationRecommendations =>
      'Gender helps tailor hydration recommendations.';

  @override
  String get femaleStatusHelpsTailorHydrationRecommendations =>
      'Female status helps tailor hydration recommendations.';

  @override
  String get pleaseEnterAValidWeight => 'Please enter a valid weight';

  @override
  String get saveSettings => 'Save Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get switchBetweenLightAndDarkThemes =>
      'Switch between light and dark themes';

  @override
  String get noCustomVolumes => 'No custom volumes';

  @override
  String get addYourPreferredIntakeVolumes =>
      'Add your preferred intake volumes';

  @override
  String get addNewVolume => 'Add New Volume';

  @override
  String editVolume({required String name}) {
    return 'Edit Volume $name';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get add => 'Add';

  @override
  String get settingsSavedSuccessfully => 'Settings saved successfully!';

  @override
  String get volumeDeleted => 'Volume deleted';

  @override
  String get namePlaceholder => 'Name (e.g., Coffee Cup)';

  @override
  String get volumeMilliliterPlaceholder => 'Volume (mL)';

  @override
  String get volumeOuncePlaceholder => 'Volume (Oz)';

  @override
  String get physicalActivityLevel => 'Physical Activity Level';

  @override
  String get weightUnit => 'Weight Unit';

  @override
  String get volumeUnit => 'Volume Unit';

  @override
  String get temperatureUnit => 'Temperature Unit';

  @override
  String get healthStatus => 'Health Status';

  @override
  String get preferences => 'Preferences';

  @override
  String get quickAddVolumes => 'Quick Add Volumes';

  @override
  String get configureYourPreferredIntakeVolumesForQuickAccess =>
      'Configure your preferred intake volumes for quick access';

  @override
  String
  get selectYourCurrentHealthStatusForMoreAccurateHydrationRecommendations =>
      'Select your current health status for more accurate hydration recommendations';

  @override
  String get howActiveAreYouOnATypicalDay =>
      'How active are you on a typical day?';

  @override
  String get chooseYourPreferredWeightUnit =>
      'Choose your preferred weight unit.';

  @override
  String get chooseYourPreferredVolumeUnit =>
      'Choose your preferred volume unit.';

  @override
  String get chooseYourPreferredTemperatureUnit =>
      'Choose your preferred temperature unit.';

  @override
  String get weeklyProgress => 'Weekly Progress';

  @override
  String get monthlyProgress => 'Monthly Progress';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get enterName => 'Enter name';

  @override
  String get enterVolume => 'Enter volume';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get personalInfoDescription =>
      'Help us personalize your hydration experience';

  @override
  String get continueText => 'Continue';

  @override
  String get pregnantOrBreastfeeding => 'Are you pregnant or breastfeeding?';

  @override
  String get pregnant => 'Pregnant';

  @override
  String get breastfeeding => 'Breastfeeding';

  @override
  String get none => 'None';

  @override
  String get enterYourAge => 'Enter your age';

  @override
  String get enterYourWeight => 'Enter your weight';

  @override
  String get no => 'No';

  @override
  String get whatShouldICallYou => 'What should I call you?';

  @override
  String get whatIsYourPhysicalActivityLevel =>
      'What is your physical activity level?';

  @override
  String get pleaseSelectALevelThatMatchesYourDailyRoutine =>
      'Please select a level that matches your daily routine';

  @override
  String get allowLocalization => 'Allow localization';

  @override
  String get allowLocalizationDescription1 =>
      'A hot weather = drinking more water';

  @override
  String get allowLocalizationDescription2 =>
      'Letting me access location would allow me to check weather status and update water intake objectives accordingly!';

  @override
  String get allowLocalizationFailed =>
      'Localization permissions are not granted.';

  @override
  String get allowLocalizationPleaseAllow => 'Please allow localization!';

  @override
  String get trackWaterIntake => 'Track Water Intake';

  @override
  String get readyDescription =>
      'You are all set to start tracking your water intake and stay hydrated!';

  @override
  String get readyHeadline => 'You\'re all set!';

  @override
  String get readyMotivation =>
      'Staying hydrated boosts your energy and focus!';

  @override
  String get glassOfWater => 'Glass of Water';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get pleaseTryAgain => 'Please try again';

  @override
  String get couldNotLoadUserData => 'Could not load user data';

  @override
  String get failedToLoadWeatherData =>
      'Failed to load weather data. Please try again!';

  @override
  String get selectAnIcon => 'Select an icon';

  @override
  String get failedToCalculateWaterIntakeGoal =>
      'Failed to calculate water intake goal';

  @override
  String remainingValue({required String value}) {
    return 'Remaining: $value';
  }

  @override
  String get goalReached => 'Goal reached';

  @override
  String extraIntakeInMilliliter({required int value}) {
    return '+${value}mL';
  }

  @override
  String extraIntakeInOunce({required int value}) {
    return '+${value}Oz';
  }

  @override
  String get illness => 'Illness';

  @override
  String get heartDisease => 'Heart Disease';

  @override
  String get diabetes => 'Diabetes';

  @override
  String get feverOrDiarrhea => 'Fever or Diarrhea';

  @override
  String get healthy => 'Healthy';

  @override
  String get healthStatusDescription =>
      'Tell me about your current health so I can support your hydration journey.';

  @override
  String get pleaseSelectHealthStatus => 'Please select your health status';

  @override
  String get goalMet => 'Goal met!';

  @override
  String leftToGoal({required String value}) {
    return 'Left to goal: $value';
  }

  @override
  String get todayIntakes => 'Today\'s Intakes';

  @override
  String get greatJobGoalReached =>
      'Great job! You\'ve reached your goal today.';

  @override
  String get keepGoingGoalNotReached =>
      'Keep going! Stay hydrated and reach your goal.';

  @override
  String xHours({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 hour',
      zero: '0 hours',
      other: '$count hours',
    );
    return '$_temp0';
  }

  @override
  String xMinutes({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 minute',
      zero: '0 minutes',
      other: '$count minutes',
    );
    return '$_temp0';
  }

  @override
  String lastIntakeSince({required String time}) {
    return 'Last Intake: $time ago';
  }

  @override
  String get sedentary => 'Sedentary';

  @override
  String get sedentaryDescription =>
      'Mostly sitting throughout the day with little to no physical activity.';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get lightDescription =>
      'Occasional movement like walking or standing but no structured exercise.';

  @override
  String get moderate => 'Moderate';

  @override
  String get moderateDescription =>
      'Regular movement including some workouts or an active lifestyle.';

  @override
  String get highlyActive => 'Highly Active';

  @override
  String get highlyActiveDescription =>
      'Consistent physical effort with intense exercise or physically demanding work.';

  @override
  String get extremelyActive => 'Extremely Active';

  @override
  String get extremelyActiveDescription =>
      'Intense daily workouts or physically demanding job requiring high endurance.';

  @override
  String get thisWeek => 'This Week';

  @override
  String get total => 'Total';

  @override
  String get goalMetOnDays => 'Goal Met on Days';

  @override
  String get bestStreak => 'Best Streak';

  @override
  String compareToLastWeek({required Object value}) {
    return '$value compared to last week';
  }

  @override
  String metGoalOnDays({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Met Goal on $count days',
      one: 'Met Goal on 1 day',
      zero: 'Goal was not met',
    );
    return '$_temp0';
  }

  @override
  String get stayHydrated =>
      'Stay hydrated! Try to hit your daily goal more often.';

  @override
  String get comparedToYesterday => 'compared to yesterday';

  @override
  String get thisMonth => 'This Month';

  @override
  String get partial => 'Partial';

  @override
  String get customizeYourHydrationExperience =>
      'Customize your hydration experience';

  @override
  String get getStartedCaption =>
      'Stay hydrated and track your water intake effortlessly. Let’s build a healthier habit together!';

  @override
  String get getStarted => 'Get Started';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get chooseYourPreferredThemeAppearance =>
      'Choose your preferred theme appearance';

  @override
  String welcomeX({required String name}) {
    return 'Welcome, $name';
  }

  @override
  String get userNotFound => 'User not found';

  @override
  String bestDayWithValue({required DateTime day, required double value}) {
    final intl.DateFormat dayDateFormat = intl.DateFormat.EEEE(localeName);
    final String dayString = dayDateFormat.format(day);

    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.percentPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'Best: $dayString with $valueString';
  }

  @override
  String lowestDayWithValue({required DateTime day, required double value}) {
    final intl.DateFormat dayDateFormat = intl.DateFormat.EEEE(localeName);
    final String dayString = dayDateFormat.format(day);

    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.percentPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'Lowest: $dayString with $valueString';
  }
}
