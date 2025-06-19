import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.g.dart';

@riverpod
Future<GPSCoordinates?> location(Ref ref) async {
  Location location = Location();

  bool serviceEnabled = await ref.watch(locationEnabledProvider.future);
  if (serviceEnabled == false) {
    serviceEnabled = await location.requestService();
    if (serviceEnabled == false) {
      return null;
    }
  }

  bool permissionGranted = await ref.watch(locationPermissionsGrantedProvider.future);
  if (permissionGranted == false) {
    final PermissionStatus result = await location.requestPermission();
    if (result != PermissionStatus.granted) {
      return null;
    }
  }

  return location.getLocation().then((data) {
    final double? longitude = data.longitude;
    final double? latitude = data.latitude;

    if (latitude == null || longitude == null) {
      return null;
    }

    return GPSCoordinates(longitude, latitude);
  });
}

@riverpod
Future<bool> locationEnabled(Ref ref) {
  return Location().serviceEnabled();
}

@riverpod
Future<bool> locationPermissionsGranted(Ref ref) {
  return Location().hasPermission().then((result) {
    return result == PermissionStatus.granted;
  });
}

class GPSCoordinates {
  final double longitude;
  final double latitude;

  const GPSCoordinates(this.longitude, this.latitude);
}
