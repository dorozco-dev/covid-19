import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationUtil {
  Future<LatLng> getLatAndLong() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return new LatLng(position.latitude, position.longitude);
  }
}