import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:orbis/domain/busineslogic/map/map_state.dart';

class MapCubit extends Cubit<MapState> {
  final MapController mapController = MapController();
  final String oresApiKey =
      '5b3ce3597851110001cf6248bd27d9cefea2424189300cd5080e37e9';
  List<Marker> newMarkers = [];
  List<LatLng> routePoint = [LatLng(0, 0)];
  String address = "";
  LocationData? userLocation;

  LocationData? currentLocation;
  MapCubit() : super(MapInitial()) {
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    emit(MapLoading());
    var location = Location();
    try {
      userLocation = await location.getLocation();
      currentLocation = userLocation;
      newMarkers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(userLocation!.latitude!, userLocation!.longitude!),
          child: const Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      );
      emit(
        MapLoaded(
          currentLocation: currentLocation,
          routePoints: routePoint,
          markers: newMarkers,
        ),
      );

      location.onLocationChanged.listen((newLocation) {
        nameLocation(newLocation.latitude!, newLocation.longitude!);
        emit(
          MapLoaded(
            currentLocation: newLocation,
            routePoints: (state as MapLoaded).routePoints,
            markers: (state as MapLoaded).markers,
          ),
        );
      });
    } catch (e) {
      emit(MapError("Failed to get location"));
    }
  }

  Future<void> getRoute(LatLng destination) async {
    if (state is! MapLoaded) return;
    final currentState = state as MapLoaded;

    final response = await http.get(
      Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$oresApiKey&start=${currentState.currentLocation!.longitude},${currentState.currentLocation!.latitude}&end=${destination.longitude},${destination.latitude}',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      final List coords = data['features'][0]['bbox'];
      routePoint = [LatLng(coords[1], coords[0])];
      newMarkers = List.from(currentState.markers)..add(
        Marker(
          point: destination,
          child: const Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      );

      nameLocation(coords[1], coords[0]);

      emit(
        MapLoaded(
          currentLocation: currentState.currentLocation,
          routePoints: routePoint,
          markers: newMarkers,
        ),
      );
    }
  }

  Future<void> searchLocation(String value) async {
    emit(MapLoading());
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openrouteservice.org/geocode/autocomplete?api_key=$oresApiKey&text=$value&layers=country,address,macrocounty',
        ),
      );
      print(
        'https://api.openrouteservice.org/geocode/autocomplete?api_key=$oresApiKey&text=$value&layers=country,address,macrocounty',
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List coords = data['features'][0]['geometry']['coordinates'];
        print(coords);
        currentLocation!.altitude != coords[1];
        currentLocation!.longitude != coords[0];
        routePoint =
            coords.map((coord) => LatLng(coords[1], coords[0])).toList();
        newMarkers.add(
          Marker(
            height: 80,
            width: 80,
            point: LatLng(
              currentLocation!.altitude!,
              currentLocation!.longitude!,
            ),
            child: Icon(Icons.location_on, color: Colors.red[900], size: 40),
          ),
        );
        mapController.move(
          LatLng(currentLocation!.altitude!, currentLocation!.longitude!),
          8,
        );
        nameLocation(currentLocation!.altitude!, currentLocation!.longitude!);
        emit(
          MapLoaded(
            currentLocation: currentLocation,
            routePoints: routePoint,
            markers: newMarkers,
          ),
        );
        print(
          "{{{{{{{{{{{{{{{{{{{{{{{{{{{{{object}}}}}}}}}}}}}}}}}}}}}}}}}}}}}",
        );
      }
    } catch (e) {}
    return;
  }

  void addDestinationMarker(LatLng point) {
   
    if (state is! MapLoaded) return;
    final currentState = state as MapLoaded;

     newMarkers = List.from(currentState.markers)..add(
      Marker(
        point: point,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
    );

    // emit(
    //   MapLoaded(
    //     currentLocation: currentState.currentLocation,
    //     routePoints: currentState.routePoints,
    //     markers: newMarkers,
    //   ),
    // );
    getRoute(point);
  }

  Future<String> nameLocation(double lat, double lng) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng',
        ),
        headers: {
          'User-Agent': 'YourAppName/1.0 (contact@example.com)',
          'Accept-Language': 'ar',
        },
      );
      print(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng',
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        address = data['display_name'];
        print(address);
        return address;
      }
    } catch (e) {
      return "";
    }
    return address;
  }

  movetomylocation() {
    emit(MapLoading());
    mapController.move(
      LatLng(userLocation!.latitude!, userLocation!.longitude!),
      15,
    );
    emit(
      MapLoaded(
        currentLocation: userLocation,
        routePoints: routePoint,
        markers: newMarkers,
      ),
    );
  }
}
