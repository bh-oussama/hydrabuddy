import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @insights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get insights;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name} 👋'**
  String goodMorning({required String name});

  /// No description provided for @loadingWeatherData.
  ///
  /// In en, this message translates to:
  /// **'Loading weather data...'**
  String get loadingWeatherData;

  /// No description provided for @couldNotLoadWeather.
  ///
  /// In en, this message translates to:
  /// **'Could not load weather.'**
  String get couldNotLoadWeather;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @celsius.
  ///
  /// In en, this message translates to:
  /// **'Celsius'**
  String get celsius;

  /// No description provided for @celsiusAbbrev.
  ///
  /// In en, this message translates to:
  /// **'C'**
  String get celsiusAbbrev;

  /// celsiusAmount
  ///
  /// In en, this message translates to:
  /// **'{amount, plural, other{{amount} C} zero{0 C} one{1 C}}'**
  String celsiusAmount({required int amount});

  /// No description provided for @fahrenheit.
  ///
  /// In en, this message translates to:
  /// **'Fahrenheit'**
  String get fahrenheit;

  /// No description provided for @fahrenheitAbbrev.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get fahrenheitAbbrev;

  /// fahrenheitAmount
  ///
  /// In en, this message translates to:
  /// **'{amount, plural, other{{amount} F} zero{0 F} one{1 F}}'**
  String fahrenheitAmount({required int amount});

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'Kg'**
  String get kg;

  /// kg
  ///
  /// In en, this message translates to:
  /// **'{amount, plural, other{{amount} kg} zero{0 kg} one{1 kg}}'**
  String kgAmount({required int amount});

  /// No description provided for @pounds.
  ///
  /// In en, this message translates to:
  /// **'Pounds'**
  String get pounds;

  /// lb
  ///
  /// In en, this message translates to:
  /// **'{amount, plural, other{{amount} lbs} zero{0 lb} one{1 lb}}'**
  String lbAmount({required int amount});

  /// No description provided for @liter.
  ///
  /// In en, this message translates to:
  /// **'Liter'**
  String get liter;

  /// No description provided for @literAbbrev.
  ///
  /// In en, this message translates to:
  /// **'L'**
  String get literAbbrev;

  /// No description provided for @milliliter.
  ///
  /// In en, this message translates to:
  /// **'Milliliter'**
  String get milliliter;

  /// No description provided for @milliliterAbbrev.
  ///
  /// In en, this message translates to:
  /// **'mL'**
  String get milliliterAbbrev;

  /// Amount in milliliters
  ///
  /// In en, this message translates to:
  /// **'{amount}mL'**
  String amountInML({required int amount});

  /// No description provided for @ounce.
  ///
  /// In en, this message translates to:
  /// **'Ounce'**
  String get ounce;

  /// No description provided for @ounceAbbrev.
  ///
  /// In en, this message translates to:
  /// **'Oz'**
  String get ounceAbbrev;

  /// Amount in Ounces
  ///
  /// In en, this message translates to:
  /// **'{amount}oz'**
  String amountInOunce({required int amount});

  /// No description provided for @leftToday.
  ///
  /// In en, this message translates to:
  /// **'left today'**
  String get leftToday;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// drunkAmount
  ///
  /// In en, this message translates to:
  /// **'Drunk: {amount}'**
  String drunkAmount({required String amount});

  /// No description provided for @onTrack.
  ///
  /// In en, this message translates to:
  /// **'On Track'**
  String get onTrack;

  /// No description provided for @quickAdd.
  ///
  /// In en, this message translates to:
  /// **'Quick Add'**
  String get quickAdd;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @invalidValue.
  ///
  /// In en, this message translates to:
  /// **'Invalid value'**
  String get invalidValue;

  /// No description provided for @customAmount.
  ///
  /// In en, this message translates to:
  /// **'Custom Amount'**
  String get customAmount;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get enterAmount;

  /// No description provided for @recentIntakes.
  ///
  /// In en, this message translates to:
  /// **'Recent Intakes'**
  String get recentIntakes;

  /// No description provided for @noIntakesYet.
  ///
  /// In en, this message translates to:
  /// **'No intakes yet'**
  String get noIntakesYet;

  /// No description provided for @startTrackingYourWaterIntake.
  ///
  /// In en, this message translates to:
  /// **'Start tracking your water intake!'**
  String get startTrackingYourWaterIntake;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @yourInsights.
  ///
  /// In en, this message translates to:
  /// **'Your Insights'**
  String get yourInsights;

  /// No description provided for @monthlySummary.
  ///
  /// In en, this message translates to:
  /// **'Monthly Summary'**
  String get monthlySummary;

  /// No description provided for @totalVolume.
  ///
  /// In en, this message translates to:
  /// **'Total Volume'**
  String get totalVolume;

  /// No description provided for @totalIntakes.
  ///
  /// In en, this message translates to:
  /// **'Total Intakes'**
  String get totalIntakes;

  /// No description provided for @averagePerDay.
  ///
  /// In en, this message translates to:
  /// **'Average Per Day'**
  String get averagePerDay;

  /// No description provided for @averagePerDayAbbreviation.
  ///
  /// In en, this message translates to:
  /// **'Avg/Day'**
  String get averagePerDayAbbreviation;

  /// No description provided for @todayTotal.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Total'**
  String get todayTotal;

  /// No description provided for @averageIntake.
  ///
  /// In en, this message translates to:
  /// **'Average Intake'**
  String get averageIntake;

  /// No description provided for @failedToLoadMonthlyData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load monthly data'**
  String get failedToLoadMonthlyData;

  /// No description provided for @noDataThisMonth.
  ///
  /// In en, this message translates to:
  /// **'No data this month'**
  String get noDataThisMonth;

  /// No description provided for @startTrackingToSeeYourMonthlyProgress.
  ///
  /// In en, this message translates to:
  /// **'Start tracking to see your monthly progress!'**
  String get startTrackingToSeeYourMonthlyProgress;

  /// No description provided for @failedToLoadTodayData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load today\'s data'**
  String get failedToLoadTodayData;

  /// No description provided for @noIntakesToday.
  ///
  /// In en, this message translates to:
  /// **'No intakes today'**
  String get noIntakesToday;

  /// No description provided for @startTrackingToSeeYourWeeklyProgress.
  ///
  /// In en, this message translates to:
  /// **'Start tracking to see your weekly progress!'**
  String get startTrackingToSeeYourWeeklyProgress;

  /// No description provided for @failedToLoadWeeklyData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load weekly data'**
  String get failedToLoadWeeklyData;

  /// No description provided for @noDataThisWeek.
  ///
  /// In en, this message translates to:
  /// **'No data this week'**
  String get noDataThisWeek;

  /// No description provided for @profileInformation.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInformation;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @yourNameHelpsPersonalizeYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Your name helps personalize your experience.'**
  String get yourNameHelpsPersonalizeYourExperience;

  /// No description provided for @pleaseEnterAValidAge.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid age'**
  String get pleaseEnterAValidAge;

  /// No description provided for @forAccurateHydrationAdvice.
  ///
  /// In en, this message translates to:
  /// **'For accurate hydration advice.'**
  String get forAccurateHydrationAdvice;

  /// No description provided for @usedToCalculateYourDailyIntake.
  ///
  /// In en, this message translates to:
  /// **'Used to calculate your daily intake.'**
  String get usedToCalculateYourDailyIntake;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @femaleStatus.
  ///
  /// In en, this message translates to:
  /// **'Female Status'**
  String get femaleStatus;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @genderHelpsTailorHydrationRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Gender helps tailor hydration recommendations.'**
  String get genderHelpsTailorHydrationRecommendations;

  /// No description provided for @femaleStatusHelpsTailorHydrationRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Female status helps tailor hydration recommendations.'**
  String get femaleStatusHelpsTailorHydrationRecommendations;

  /// No description provided for @pleaseEnterAValidWeight.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid weight'**
  String get pleaseEnterAValidWeight;

  /// No description provided for @saveSettings.
  ///
  /// In en, this message translates to:
  /// **'Save Settings'**
  String get saveSettings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @switchBetweenLightAndDarkThemes.
  ///
  /// In en, this message translates to:
  /// **'Switch between light and dark themes'**
  String get switchBetweenLightAndDarkThemes;

  /// No description provided for @noCustomVolumes.
  ///
  /// In en, this message translates to:
  /// **'No custom volumes'**
  String get noCustomVolumes;

  /// No description provided for @addYourPreferredIntakeVolumes.
  ///
  /// In en, this message translates to:
  /// **'Add your preferred intake volumes'**
  String get addYourPreferredIntakeVolumes;

  /// No description provided for @addNewVolume.
  ///
  /// In en, this message translates to:
  /// **'Add New Volume'**
  String get addNewVolume;

  /// editVolume
  ///
  /// In en, this message translates to:
  /// **'Edit Volume {name}'**
  String editVolume({required String name});

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @settingsSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Settings saved successfully!'**
  String get settingsSavedSuccessfully;

  /// No description provided for @volumeDeleted.
  ///
  /// In en, this message translates to:
  /// **'Volume deleted'**
  String get volumeDeleted;

  /// No description provided for @namePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Name (e.g., Coffee Cup)'**
  String get namePlaceholder;

  /// No description provided for @volumeMilliliterPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Volume (mL)'**
  String get volumeMilliliterPlaceholder;

  /// No description provided for @volumeOuncePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Volume (Oz)'**
  String get volumeOuncePlaceholder;

  /// No description provided for @physicalActivityLevel.
  ///
  /// In en, this message translates to:
  /// **'Physical Activity Level'**
  String get physicalActivityLevel;

  /// No description provided for @weightUnit.
  ///
  /// In en, this message translates to:
  /// **'Weight Unit'**
  String get weightUnit;

  /// No description provided for @volumeUnit.
  ///
  /// In en, this message translates to:
  /// **'Volume Unit'**
  String get volumeUnit;

  /// No description provided for @temperatureUnit.
  ///
  /// In en, this message translates to:
  /// **'Temperature Unit'**
  String get temperatureUnit;

  /// No description provided for @healthStatus.
  ///
  /// In en, this message translates to:
  /// **'Health Status'**
  String get healthStatus;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @quickAddVolumes.
  ///
  /// In en, this message translates to:
  /// **'Quick Add Volumes'**
  String get quickAddVolumes;

  /// No description provided for @configureYourPreferredIntakeVolumesForQuickAccess.
  ///
  /// In en, this message translates to:
  /// **'Configure your preferred intake volumes for quick access'**
  String get configureYourPreferredIntakeVolumesForQuickAccess;

  /// No description provided for @selectYourCurrentHealthStatusForMoreAccurateHydrationRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Select your current health status for more accurate hydration recommendations'**
  String
  get selectYourCurrentHealthStatusForMoreAccurateHydrationRecommendations;

  /// No description provided for @howActiveAreYouOnATypicalDay.
  ///
  /// In en, this message translates to:
  /// **'How active are you on a typical day?'**
  String get howActiveAreYouOnATypicalDay;

  /// No description provided for @chooseYourPreferredWeightUnit.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred weight unit.'**
  String get chooseYourPreferredWeightUnit;

  /// No description provided for @chooseYourPreferredVolumeUnit.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred volume unit.'**
  String get chooseYourPreferredVolumeUnit;

  /// No description provided for @chooseYourPreferredTemperatureUnit.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred temperature unit.'**
  String get chooseYourPreferredTemperatureUnit;

  /// No description provided for @weeklyProgress.
  ///
  /// In en, this message translates to:
  /// **'Weekly Progress'**
  String get weeklyProgress;

  /// No description provided for @monthlyProgress.
  ///
  /// In en, this message translates to:
  /// **'Monthly Progress'**
  String get monthlyProgress;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get enterName;

  /// No description provided for @enterVolume.
  ///
  /// In en, this message translates to:
  /// **'Enter volume'**
  String get enterVolume;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @personalInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'Help us personalize your hydration experience'**
  String get personalInfoDescription;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @pregnantOrBreastfeeding.
  ///
  /// In en, this message translates to:
  /// **'Are you pregnant or breastfeeding?'**
  String get pregnantOrBreastfeeding;

  /// No description provided for @pregnant.
  ///
  /// In en, this message translates to:
  /// **'Pregnant'**
  String get pregnant;

  /// No description provided for @breastfeeding.
  ///
  /// In en, this message translates to:
  /// **'Breastfeeding'**
  String get breastfeeding;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @enterYourAge.
  ///
  /// In en, this message translates to:
  /// **'Enter your age'**
  String get enterYourAge;

  /// No description provided for @enterYourWeight.
  ///
  /// In en, this message translates to:
  /// **'Enter your weight'**
  String get enterYourWeight;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @whatShouldICallYou.
  ///
  /// In en, this message translates to:
  /// **'What should I call you?'**
  String get whatShouldICallYou;

  /// No description provided for @whatIsYourPhysicalActivityLevel.
  ///
  /// In en, this message translates to:
  /// **'What is your physical activity level?'**
  String get whatIsYourPhysicalActivityLevel;

  /// No description provided for @pleaseSelectALevelThatMatchesYourDailyRoutine.
  ///
  /// In en, this message translates to:
  /// **'Please select a level that matches your daily routine'**
  String get pleaseSelectALevelThatMatchesYourDailyRoutine;

  /// No description provided for @allowLocalization.
  ///
  /// In en, this message translates to:
  /// **'Allow localization'**
  String get allowLocalization;

  /// No description provided for @allowLocalizationDescription1.
  ///
  /// In en, this message translates to:
  /// **'A hot weather = drinking more water'**
  String get allowLocalizationDescription1;

  /// No description provided for @allowLocalizationDescription2.
  ///
  /// In en, this message translates to:
  /// **'Letting me access location would allow me to check weather status and update water intake objectives accordingly!'**
  String get allowLocalizationDescription2;

  /// No description provided for @allowLocalizationFailed.
  ///
  /// In en, this message translates to:
  /// **'Localization permissions are not granted.'**
  String get allowLocalizationFailed;

  /// No description provided for @allowLocalizationPleaseAllow.
  ///
  /// In en, this message translates to:
  /// **'Please allow localization!'**
  String get allowLocalizationPleaseAllow;

  /// No description provided for @trackWaterIntake.
  ///
  /// In en, this message translates to:
  /// **'Track Water Intake'**
  String get trackWaterIntake;

  /// No description provided for @readyDescription.
  ///
  /// In en, this message translates to:
  /// **'You are all set to start tracking your water intake and stay hydrated!'**
  String get readyDescription;

  /// No description provided for @readyHeadline.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set!'**
  String get readyHeadline;

  /// No description provided for @readyMotivation.
  ///
  /// In en, this message translates to:
  /// **'Staying hydrated boosts your energy and focus!'**
  String get readyMotivation;

  /// No description provided for @glassOfWater.
  ///
  /// In en, this message translates to:
  /// **'Glass of Water'**
  String get glassOfWater;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @pleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get pleaseTryAgain;

  /// No description provided for @couldNotLoadUserData.
  ///
  /// In en, this message translates to:
  /// **'Could not load user data'**
  String get couldNotLoadUserData;

  /// No description provided for @failedToLoadWeatherData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load weather data. Please try again!'**
  String get failedToLoadWeatherData;

  /// No description provided for @selectAnIcon.
  ///
  /// In en, this message translates to:
  /// **'Select an icon'**
  String get selectAnIcon;

  /// No description provided for @failedToCalculateWaterIntakeGoal.
  ///
  /// In en, this message translates to:
  /// **'Failed to calculate water intake goal'**
  String get failedToCalculateWaterIntakeGoal;

  /// remainingValue
  ///
  /// In en, this message translates to:
  /// **'Remaining: {value}'**
  String remainingValue({required String value});

  /// No description provided for @goalReached.
  ///
  /// In en, this message translates to:
  /// **'Goal reached'**
  String get goalReached;

  /// extraIntakeInMilliliter
  ///
  /// In en, this message translates to:
  /// **'+{value}mL'**
  String extraIntakeInMilliliter({required int value});

  /// extraIntakeInOunce
  ///
  /// In en, this message translates to:
  /// **'+{value}Oz'**
  String extraIntakeInOunce({required int value});

  /// No description provided for @illness.
  ///
  /// In en, this message translates to:
  /// **'Illness'**
  String get illness;

  /// No description provided for @heartDisease.
  ///
  /// In en, this message translates to:
  /// **'Heart Disease'**
  String get heartDisease;

  /// No description provided for @diabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get diabetes;

  /// No description provided for @feverOrDiarrhea.
  ///
  /// In en, this message translates to:
  /// **'Fever or Diarrhea'**
  String get feverOrDiarrhea;

  /// No description provided for @healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get healthy;

  /// No description provided for @healthStatusDescription.
  ///
  /// In en, this message translates to:
  /// **'Tell me about your current health so I can support your hydration journey.'**
  String get healthStatusDescription;

  /// No description provided for @pleaseSelectHealthStatus.
  ///
  /// In en, this message translates to:
  /// **'Please select your health status'**
  String get pleaseSelectHealthStatus;

  /// No description provided for @goalMet.
  ///
  /// In en, this message translates to:
  /// **'Goal met!'**
  String get goalMet;

  /// leftToGoal
  ///
  /// In en, this message translates to:
  /// **'Left to goal: {value}'**
  String leftToGoal({required String value});

  /// No description provided for @todayIntakes.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Intakes'**
  String get todayIntakes;

  /// No description provided for @greatJobGoalReached.
  ///
  /// In en, this message translates to:
  /// **'Great job! You\'ve reached your goal today.'**
  String get greatJobGoalReached;

  /// No description provided for @keepGoingGoalNotReached.
  ///
  /// In en, this message translates to:
  /// **'Keep going! Stay hydrated and reach your goal.'**
  String get keepGoingGoalNotReached;

  /// X hours
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} hours} zero{0 hours} one{1 hour}}'**
  String xHours({required int count});

  /// X minutes
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{{count} minutes} zero{0 minutes} one{1 minute}}'**
  String xMinutes({required int count});

  /// Last intake since
  ///
  /// In en, this message translates to:
  /// **'Last Intake: {time} ago'**
  String lastIntakeSince({required String time});

  /// No description provided for @sedentary.
  ///
  /// In en, this message translates to:
  /// **'Sedentary'**
  String get sedentary;

  /// No description provided for @sedentaryDescription.
  ///
  /// In en, this message translates to:
  /// **'Mostly sitting throughout the day with little to no physical activity.'**
  String get sedentaryDescription;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @lightDescription.
  ///
  /// In en, this message translates to:
  /// **'Occasional movement like walking or standing but no structured exercise.'**
  String get lightDescription;

  /// No description provided for @moderate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get moderate;

  /// No description provided for @moderateDescription.
  ///
  /// In en, this message translates to:
  /// **'Regular movement including some workouts or an active lifestyle.'**
  String get moderateDescription;

  /// No description provided for @highlyActive.
  ///
  /// In en, this message translates to:
  /// **'Highly Active'**
  String get highlyActive;

  /// No description provided for @highlyActiveDescription.
  ///
  /// In en, this message translates to:
  /// **'Consistent physical effort with intense exercise or physically demanding work.'**
  String get highlyActiveDescription;

  /// No description provided for @extremelyActive.
  ///
  /// In en, this message translates to:
  /// **'Extremely Active'**
  String get extremelyActive;

  /// No description provided for @extremelyActiveDescription.
  ///
  /// In en, this message translates to:
  /// **'Intense daily workouts or physically demanding job requiring high endurance.'**
  String get extremelyActiveDescription;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @goalMetOnDays.
  ///
  /// In en, this message translates to:
  /// **'Goal Met on Days'**
  String get goalMetOnDays;

  /// No description provided for @bestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best Streak'**
  String get bestStreak;

  /// No description provided for @compareToLastWeek.
  ///
  /// In en, this message translates to:
  /// **'{value} compared to last week'**
  String compareToLastWeek({required Object value});

  /// metGoalOnDays
  ///
  /// In en, this message translates to:
  /// **'{count, plural, zero{Goal was not met} one{Met Goal on 1 day} other{Met Goal on {count} days}}'**
  String metGoalOnDays({required int count});

  /// No description provided for @stayHydrated.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated! Try to hit your daily goal more often.'**
  String get stayHydrated;

  /// No description provided for @comparedToYesterday.
  ///
  /// In en, this message translates to:
  /// **'compared to yesterday'**
  String get comparedToYesterday;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get partial;

  /// No description provided for @customizeYourHydrationExperience.
  ///
  /// In en, this message translates to:
  /// **'Customize your hydration experience'**
  String get customizeYourHydrationExperience;

  /// No description provided for @getStartedCaption.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated and track your water intake effortlessly. Let’s build a healthier habit together!'**
  String get getStartedCaption;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// No description provided for @chooseYourPreferredThemeAppearance.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme appearance'**
  String get chooseYourPreferredThemeAppearance;

  /// welcomeX
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcomeX({required String name});

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get userNotFound;

  /// bestDayWithValue
  ///
  /// In en, this message translates to:
  /// **'Best: {day} with {value}'**
  String bestDayWithValue({required DateTime day, required double value});

  /// lowestDayWithValue
  ///
  /// In en, this message translates to:
  /// **'Lowest: {day} with {value}'**
  String lowestDayWithValue({required DateTime day, required double value});
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
