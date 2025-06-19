// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(amount) => "${amount}mL";

  static String m1(amount) => "${amount}oz";

  static String m2(day, value) => "Best: ${day} with ${value}";

  static String m3(amount) =>
      "${Intl.plural(amount, zero: '0 C', one: '1 C', other: '${amount} C')}";

  static String m4(value) => "${value} compared to last week";

  static String m5(amount) => "Drunk: ${amount}";

  static String m6(name) => "Edit Volume ${name}";

  static String m7(value) => "+${value}mL";

  static String m8(value) => "+${value}Oz";

  static String m9(amount) =>
      "${Intl.plural(amount, zero: '0 F', one: '1 F', other: '${amount} F')}";

  static String m10(name) => "Good morning, ${name} 👋";

  static String m11(amount) =>
      "${Intl.plural(amount, zero: '0 kg', one: '1 kg', other: '${amount} kg')}";

  static String m12(time) => "Last Intake: ${time} ago";

  static String m13(amount) =>
      "${Intl.plural(amount, zero: '0 lb', one: '1 lb', other: '${amount} lbs')}";

  static String m14(value) => "Left to goal: ${value}";

  static String m15(day, value) => "Lowest: ${day} with ${value}";

  static String m16(count) =>
      "${Intl.plural(count, zero: 'Goal was not met', one: 'Met Goal on 1 day', other: 'Met Goal on ${count} days')}";

  static String m17(value) => "Remaining: ${value}";

  static String m18(name) => "Welcome, ${name}";

  static String m19(count) =>
      "${Intl.plural(count, zero: '0 hours', one: '1 hour', other: '${count} hours')}";

  static String m20(count) =>
      "${Intl.plural(count, zero: '0 minutes', one: '1 minute', other: '${count} minutes')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addNewVolume": MessageLookupByLibrary.simpleMessage("Add New Volume"),
    "addYourPreferredIntakeVolumes": MessageLookupByLibrary.simpleMessage(
      "Add your preferred intake volumes",
    ),
    "age": MessageLookupByLibrary.simpleMessage("Age"),
    "allowLocalization": MessageLookupByLibrary.simpleMessage(
      "Allow localization",
    ),
    "allowLocalizationDescription1": MessageLookupByLibrary.simpleMessage(
      "A hot weather = drinking more water",
    ),
    "allowLocalizationDescription2": MessageLookupByLibrary.simpleMessage(
      "Letting me access location would allow me to check weather status and update water intake objectives accordingly!",
    ),
    "allowLocalizationFailed": MessageLookupByLibrary.simpleMessage(
      "Localization permissions are not granted.",
    ),
    "allowLocalizationPleaseAllow": MessageLookupByLibrary.simpleMessage(
      "Please allow localization!",
    ),
    "amountInML": m0,
    "amountInOunce": m1,
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "averageIntake": MessageLookupByLibrary.simpleMessage("Average Intake"),
    "averagePerDay": MessageLookupByLibrary.simpleMessage("Average Per Day"),
    "averagePerDayAbbreviation": MessageLookupByLibrary.simpleMessage(
      "Avg/Day",
    ),
    "bestDayWithValue": m2,
    "bestStreak": MessageLookupByLibrary.simpleMessage("Best Streak"),
    "breastfeeding": MessageLookupByLibrary.simpleMessage("Breastfeeding"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "celsius": MessageLookupByLibrary.simpleMessage("Celsius"),
    "celsiusAbbrev": MessageLookupByLibrary.simpleMessage("C"),
    "celsiusAmount": m3,
    "chooseYourPreferredTemperatureUnit": MessageLookupByLibrary.simpleMessage(
      "Choose your preferred temperature unit.",
    ),
    "chooseYourPreferredThemeAppearance": MessageLookupByLibrary.simpleMessage(
      "Choose your preferred theme appearance",
    ),
    "chooseYourPreferredVolumeUnit": MessageLookupByLibrary.simpleMessage(
      "Choose your preferred volume unit.",
    ),
    "chooseYourPreferredWeightUnit": MessageLookupByLibrary.simpleMessage(
      "Choose your preferred weight unit.",
    ),
    "compareToLastWeek": m4,
    "comparedToYesterday": MessageLookupByLibrary.simpleMessage(
      "compared to yesterday",
    ),
    "configureYourPreferredIntakeVolumesForQuickAccess":
        MessageLookupByLibrary.simpleMessage(
          "Configure your preferred intake volumes for quick access",
        ),
    "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
    "couldNotLoadUserData": MessageLookupByLibrary.simpleMessage(
      "Could not load user data",
    ),
    "couldNotLoadWeather": MessageLookupByLibrary.simpleMessage(
      "Could not load weather.",
    ),
    "customAmount": MessageLookupByLibrary.simpleMessage("Custom Amount"),
    "customizeYourHydrationExperience": MessageLookupByLibrary.simpleMessage(
      "Customize your hydration experience",
    ),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "diabetes": MessageLookupByLibrary.simpleMessage("Diabetes"),
    "drunkAmount": m5,
    "editVolume": m6,
    "enterAmount": MessageLookupByLibrary.simpleMessage("Enter amount"),
    "enterName": MessageLookupByLibrary.simpleMessage("Enter name"),
    "enterVolume": MessageLookupByLibrary.simpleMessage("Enter volume"),
    "enterYourAge": MessageLookupByLibrary.simpleMessage("Enter your age"),
    "enterYourName": MessageLookupByLibrary.simpleMessage("Enter your name"),
    "enterYourWeight": MessageLookupByLibrary.simpleMessage(
      "Enter your weight",
    ),
    "extraIntakeInMilliliter": m7,
    "extraIntakeInOunce": m8,
    "extremelyActive": MessageLookupByLibrary.simpleMessage("Extremely Active"),
    "extremelyActiveDescription": MessageLookupByLibrary.simpleMessage(
      "Intense daily workouts or physically demanding job requiring high endurance.",
    ),
    "fahrenheit": MessageLookupByLibrary.simpleMessage("Fahrenheit"),
    "fahrenheitAbbrev": MessageLookupByLibrary.simpleMessage("F"),
    "fahrenheitAmount": m9,
    "failedToCalculateWaterIntakeGoal": MessageLookupByLibrary.simpleMessage(
      "Failed to calculate water intake goal",
    ),
    "failedToLoadMonthlyData": MessageLookupByLibrary.simpleMessage(
      "Failed to load monthly data",
    ),
    "failedToLoadTodayData": MessageLookupByLibrary.simpleMessage(
      "Failed to load today\'s data",
    ),
    "failedToLoadWeatherData": MessageLookupByLibrary.simpleMessage(
      "Failed to load weather data. Please try again!",
    ),
    "failedToLoadWeeklyData": MessageLookupByLibrary.simpleMessage(
      "Failed to load weekly data",
    ),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "femaleStatus": MessageLookupByLibrary.simpleMessage("Female Status"),
    "femaleStatusHelpsTailorHydrationRecommendations":
        MessageLookupByLibrary.simpleMessage(
          "Female status helps tailor hydration recommendations.",
        ),
    "feverOrDiarrhea": MessageLookupByLibrary.simpleMessage(
      "Fever or Diarrhea",
    ),
    "forAccurateHydrationAdvice": MessageLookupByLibrary.simpleMessage(
      "For accurate hydration advice.",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "genderHelpsTailorHydrationRecommendations":
        MessageLookupByLibrary.simpleMessage(
          "Gender helps tailor hydration recommendations.",
        ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
    "getStartedCaption": MessageLookupByLibrary.simpleMessage(
      "Stay hydrated and track your water intake effortlessly. Let’s build a healthier habit together!",
    ),
    "glassOfWater": MessageLookupByLibrary.simpleMessage("Glass of Water"),
    "goal": MessageLookupByLibrary.simpleMessage("Goal"),
    "goalMet": MessageLookupByLibrary.simpleMessage("Goal met!"),
    "goalMetOnDays": MessageLookupByLibrary.simpleMessage("Goal Met on Days"),
    "goalReached": MessageLookupByLibrary.simpleMessage("Goal reached"),
    "goodMorning": m10,
    "greatJobGoalReached": MessageLookupByLibrary.simpleMessage(
      "Great job! You\'ve reached your goal today.",
    ),
    "healthStatus": MessageLookupByLibrary.simpleMessage("Health Status"),
    "healthStatusDescription": MessageLookupByLibrary.simpleMessage(
      "Tell me about your current health so I can support your hydration journey.",
    ),
    "healthy": MessageLookupByLibrary.simpleMessage("Healthy"),
    "heartDisease": MessageLookupByLibrary.simpleMessage("Heart Disease"),
    "highlyActive": MessageLookupByLibrary.simpleMessage("Highly Active"),
    "highlyActiveDescription": MessageLookupByLibrary.simpleMessage(
      "Consistent physical effort with intense exercise or physically demanding work.",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "howActiveAreYouOnATypicalDay": MessageLookupByLibrary.simpleMessage(
      "How active are you on a typical day?",
    ),
    "illness": MessageLookupByLibrary.simpleMessage("Illness"),
    "insights": MessageLookupByLibrary.simpleMessage("Insights"),
    "invalidValue": MessageLookupByLibrary.simpleMessage("Invalid value"),
    "keepGoingGoalNotReached": MessageLookupByLibrary.simpleMessage(
      "Keep going! Stay hydrated and reach your goal.",
    ),
    "kg": MessageLookupByLibrary.simpleMessage("Kg"),
    "kgAmount": m11,
    "lastIntakeSince": m12,
    "lbAmount": m13,
    "leftToGoal": m14,
    "leftToday": MessageLookupByLibrary.simpleMessage("left today"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "lightDescription": MessageLookupByLibrary.simpleMessage(
      "Occasional movement like walking or standing but no structured exercise.",
    ),
    "liter": MessageLookupByLibrary.simpleMessage("Liter"),
    "literAbbrev": MessageLookupByLibrary.simpleMessage("L"),
    "loadingWeatherData": MessageLookupByLibrary.simpleMessage(
      "Loading weather data...",
    ),
    "lowestDayWithValue": m15,
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "metGoalOnDays": m16,
    "milliliter": MessageLookupByLibrary.simpleMessage("Milliliter"),
    "milliliterAbbrev": MessageLookupByLibrary.simpleMessage("mL"),
    "moderate": MessageLookupByLibrary.simpleMessage("Moderate"),
    "moderateDescription": MessageLookupByLibrary.simpleMessage(
      "Regular movement including some workouts or an active lifestyle.",
    ),
    "month": MessageLookupByLibrary.simpleMessage("Month"),
    "monthlyProgress": MessageLookupByLibrary.simpleMessage("Monthly Progress"),
    "monthlySummary": MessageLookupByLibrary.simpleMessage("Monthly Summary"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "namePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Name (e.g., Coffee Cup)",
    ),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noCustomVolumes": MessageLookupByLibrary.simpleMessage(
      "No custom volumes",
    ),
    "noDataThisMonth": MessageLookupByLibrary.simpleMessage(
      "No data this month",
    ),
    "noDataThisWeek": MessageLookupByLibrary.simpleMessage("No data this week"),
    "noIntakesToday": MessageLookupByLibrary.simpleMessage("No intakes today"),
    "noIntakesYet": MessageLookupByLibrary.simpleMessage("No intakes yet"),
    "none": MessageLookupByLibrary.simpleMessage("None"),
    "onTrack": MessageLookupByLibrary.simpleMessage("On Track"),
    "ounce": MessageLookupByLibrary.simpleMessage("Ounce"),
    "ounceAbbrev": MessageLookupByLibrary.simpleMessage("Oz"),
    "partial": MessageLookupByLibrary.simpleMessage("Partial"),
    "personalInfo": MessageLookupByLibrary.simpleMessage(
      "Personal Information",
    ),
    "personalInfoDescription": MessageLookupByLibrary.simpleMessage(
      "Help us personalize your hydration experience",
    ),
    "physicalActivityLevel": MessageLookupByLibrary.simpleMessage(
      "Physical Activity Level",
    ),
    "pleaseEnterAValidAge": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid age",
    ),
    "pleaseEnterAValidWeight": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid weight",
    ),
    "pleaseSelectALevelThatMatchesYourDailyRoutine":
        MessageLookupByLibrary.simpleMessage(
          "Please select a level that matches your daily routine",
        ),
    "pleaseSelectHealthStatus": MessageLookupByLibrary.simpleMessage(
      "Please select your health status",
    ),
    "pleaseTryAgain": MessageLookupByLibrary.simpleMessage("Please try again"),
    "pounds": MessageLookupByLibrary.simpleMessage("Pounds"),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferences"),
    "pregnant": MessageLookupByLibrary.simpleMessage("Pregnant"),
    "pregnantOrBreastfeeding": MessageLookupByLibrary.simpleMessage(
      "Are you pregnant or breastfeeding?",
    ),
    "profileInformation": MessageLookupByLibrary.simpleMessage(
      "Profile Information",
    ),
    "progress": MessageLookupByLibrary.simpleMessage("Progress"),
    "quickAdd": MessageLookupByLibrary.simpleMessage("Quick Add"),
    "quickAddVolumes": MessageLookupByLibrary.simpleMessage(
      "Quick Add Volumes",
    ),
    "readyDescription": MessageLookupByLibrary.simpleMessage(
      "You are all set to start tracking your water intake and stay hydrated!",
    ),
    "readyHeadline": MessageLookupByLibrary.simpleMessage("You\'re all set!"),
    "readyMotivation": MessageLookupByLibrary.simpleMessage(
      "Staying hydrated boosts your energy and focus!",
    ),
    "recentIntakes": MessageLookupByLibrary.simpleMessage("Recent Intakes"),
    "remainingValue": m17,
    "required": MessageLookupByLibrary.simpleMessage("Required"),
    "saveSettings": MessageLookupByLibrary.simpleMessage("Save Settings"),
    "sedentary": MessageLookupByLibrary.simpleMessage("Sedentary"),
    "sedentaryDescription": MessageLookupByLibrary.simpleMessage(
      "Mostly sitting throughout the day with little to no physical activity.",
    ),
    "selectAnIcon": MessageLookupByLibrary.simpleMessage("Select an icon"),
    "selectYourCurrentHealthStatusForMoreAccurateHydrationRecommendations":
        MessageLookupByLibrary.simpleMessage(
          "Select your current health status for more accurate hydration recommendations",
        ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsSavedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Settings saved successfully!",
    ),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "startTrackingToSeeYourMonthlyProgress":
        MessageLookupByLibrary.simpleMessage(
          "Start tracking to see your monthly progress!",
        ),
    "startTrackingToSeeYourWeeklyProgress":
        MessageLookupByLibrary.simpleMessage(
          "Start tracking to see your weekly progress!",
        ),
    "startTrackingYourWaterIntake": MessageLookupByLibrary.simpleMessage(
      "Start tracking your water intake!",
    ),
    "stayHydrated": MessageLookupByLibrary.simpleMessage(
      "Stay hydrated! Try to hit your daily goal more often.",
    ),
    "switchBetweenLightAndDarkThemes": MessageLookupByLibrary.simpleMessage(
      "Switch between light and dark themes",
    ),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "temperatureUnit": MessageLookupByLibrary.simpleMessage("Temperature Unit"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
    "thisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
    "thisWeek": MessageLookupByLibrary.simpleMessage("This Week"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "todayIntakes": MessageLookupByLibrary.simpleMessage("Today\'s Intakes"),
    "todayTotal": MessageLookupByLibrary.simpleMessage("Today\'s Total"),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "totalIntakes": MessageLookupByLibrary.simpleMessage("Total Intakes"),
    "totalVolume": MessageLookupByLibrary.simpleMessage("Total Volume"),
    "trackWaterIntake": MessageLookupByLibrary.simpleMessage(
      "Track Water Intake",
    ),
    "usedToCalculateYourDailyIntake": MessageLookupByLibrary.simpleMessage(
      "Used to calculate your daily intake.",
    ),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
    "volumeDeleted": MessageLookupByLibrary.simpleMessage("Volume deleted"),
    "volumeMilliliterPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Volume (mL)",
    ),
    "volumeOuncePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Volume (Oz)",
    ),
    "volumeUnit": MessageLookupByLibrary.simpleMessage("Volume Unit"),
    "week": MessageLookupByLibrary.simpleMessage("Week"),
    "weeklyProgress": MessageLookupByLibrary.simpleMessage("Weekly Progress"),
    "weight": MessageLookupByLibrary.simpleMessage("Weight"),
    "weightUnit": MessageLookupByLibrary.simpleMessage("Weight Unit"),
    "welcomeX": m18,
    "whatIsYourPhysicalActivityLevel": MessageLookupByLibrary.simpleMessage(
      "What is your physical activity level?",
    ),
    "whatShouldICallYou": MessageLookupByLibrary.simpleMessage(
      "What should I call you?",
    ),
    "xHours": m19,
    "xMinutes": m20,
    "yourInsights": MessageLookupByLibrary.simpleMessage("Your Insights"),
    "yourNameHelpsPersonalizeYourExperience":
        MessageLookupByLibrary.simpleMessage(
          "Your name helps personalize your experience.",
        ),
  };
}
