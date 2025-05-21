import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final LocationData? currentLocation;
  final List<LatLng> routePoints;
  final List<Marker> markers;
 
  
  MapLoaded({
    required this.currentLocation,
    required this.routePoints,
    required this.markers,
  });
}

class MapError extends MapState {
  final String message;
  MapError(this.message);
}
