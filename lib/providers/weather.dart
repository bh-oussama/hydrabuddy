import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/weather.dart';
import 'location.dart';

part 'weather.g.dart';

@riverpod
Future<Weather?> weather(Ref ref) async {
  try {
    final GPSCoordinates? location = await ref.watch(locationProvider.future);
    if (location == null) {
      return null;
    }

    final response = await http.get(
      Uri(
        scheme: 'https',
        host: 'api.weatherapi.com',
        path: 'v1/current.json',
        queryParameters: {
          'key': '1e068000bbab443c9de103337251906',
          'q': '${location.latitude},${location.longitude}',
          'aqi': 'no',
        },
      ),
    );

    if (response.statusCode != 200) {
      debugPrint('unexpected response ${response.statusCode} ${response.body}');
      return null;
    }

    // RESPONSE Example
    //   {
    //     "location": {
    //         "name": "Nabul",
    //         "region": "Nabeul",
    //         "country": "Tunisia",
    //         "lat": 36.45,
    //         "lon": 10.733,
    //         "tz_id": "Africa/Tunis",
    //         "localtime_epoch": 1750329656,
    //         "localtime": "2025-06-19 11:40"
    //     },
    //     "current": {
    //         "last_updated_epoch": 1750329000,
    //         "last_updated": "2025-06-19 11:30",
    //         "temp_c": 27.9,
    //         "temp_f": 82.2,
    //         "is_day": 1,
    //         "condition": {
    //             "text": "Patchy rain nearby",
    //             "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
    //             "code": 1063
    //         },
    //         "wind_mph": 11.4,
    //         "wind_kph": 18.4,
    //         "wind_degree": 330,
    //         "wind_dir": "NNW",
    //         "pressure_mb": 1017.0,
    //         "pressure_in": 30.03,
    //         "precip_mm": 0.03,
    //         "precip_in": 0.0,
    //         "humidity": 47,
    //         "cloud": 65,
    //         "feelslike_c": 28.3,
    //         "feelslike_f": 83.0,
    //         "windchill_c": 27.9,
    //         "windchill_f": 82.2,
    //         "heatindex_c": 28.3,
    //         "heatindex_f": 83.0,
    //         "dewpoint_c": 15.6,
    //         "dewpoint_f": 60.0,
    //         "vis_km": 10.0,
    //         "vis_miles": 6.0,
    //         "uv": 8.0,
    //         "gust_mph": 13.1,
    //         "gust_kph": 21.1
    //     }
    // }

    final Map<String, dynamic> content = jsonDecode(response.body);

    final String? regionData = content['location']?['region']?.toString();
    final String? countryData = content['location']?['country']?.toString();
    final String? localTimeData = content['location']?['localtime']?.toString();
    final String? temperatureData = content['current']?['temp_c']?.toString();
    final String? feelsLikeData = content['current']?['feelslike_c']?.toString();
    final String? uvData = content['current']?['uv']?.toString();
    final String? humidityData = content['current']?['humidity']?.toString();

    if (regionData == null) {
      throw Exception('Missing location.region from response');
    }
    if (countryData == null) {
      throw Exception('Missing current.country from response');
    }
    if (localTimeData == null) {
      throw Exception('Missing current.localtime from response');
    }
    if (temperatureData == null) {
      throw Exception('Missing current.temp_c from response');
    }
    if (feelsLikeData == null) {
      throw Exception('Missing current.feelslike_c from response');
    }
    if (uvData == null) {
      throw Exception('Missing current.uv from response');
    }
    if (humidityData == null) {
      throw Exception('Missing current.humidityData from response');
    }
    final DateTime time = DateTime.parse(localTimeData);
    final int temperature = double.parse(temperatureData).round();
    final int feelsLike = double.parse(feelsLikeData).round();
    final double uv = double.parse(uvData);
    final int humidity = double.parse(humidityData).round();

    return Weather(
      city: regionData,
      country: countryData,
      time: time,
      temperature: temperature,
      feelsLike: feelsLike,
      uv: uv,
      humidity: humidity,
    );
  } catch (e, s) {
    debugPrintStack(label: e.toString(), stackTrace: s);
    rethrow;
  }
}
