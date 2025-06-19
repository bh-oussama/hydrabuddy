class Weather {
  final String city;
  final String country;
  final DateTime time;
  final int temperature;
  final int feelsLike;
  final double uv;
  final int humidity;

  const Weather({
    required this.city,
    required this.country,
    required this.time,
    required this.temperature,
    required this.feelsLike,
    required this.uv,
    required this.humidity,
  });

  bool get isCold {
    return temperature < 10;
  }

  bool get isDry {
    return humidity < 30;
  }

  bool get isHot {
    return temperature > 30;
  }

  bool get isHumid {
    return humidity > 70;
  }

  ({String description, int hydrationEffect}) getHydrationAdvice() {
    if (temperature >= 30) {
      if (humidity >= 70) {
        return (description: 'Scorching and sticky—hydrate generously today.', hydrationEffect: 1000);
      } else if (humidity <= 30) {
        return (description: 'Hot and dry—add some extra sips to your goal.', hydrationEffect: 750);
      } else {
        return (description: 'Warm day—boost your intake with a few more gulps.', hydrationEffect: 250);
      }
    }

    if (temperature <= 10) {
      if (humidity >= 70) {
        return (description: 'Chilly and damp—your usual hydration still matters.', hydrationEffect: 0);
      } else if (humidity <= 30) {
        return (description: 'Cold and crisp—drink steady through the chill.', hydrationEffect: 0);
      } else {
        return (description: 'Cool air—stick to your regular water target.', hydrationEffect: 0);
      }
    }

    if (temperature > 10 && temperature < 30) {
      if (humidity >= 70) {
        return (description: 'Muggy day—topping off your water goal helps.', hydrationEffect: 500);
      } else if (humidity <= 30) {
        return (description: 'A bit dry today—add a few more sips.', hydrationEffect: 500);
      } else {
        return (description: 'No extremes today—your usual intake is perfect.', hydrationEffect: 0);
      }
    }

    // Fallback
    return (description: "Weather’s calm—your regular water goal is spot on.", hydrationEffect: 0);
  }
}
