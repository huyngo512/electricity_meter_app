// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

/*import 'dart:async';
import 'dart:typed_data';

import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_config.dart';
import 'package:electricity_meter_app/general/utils/marker_label.dart';
import 'package:electricity_meter_app/general/utils/utils.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Location _locationController = Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  LatLng? _currentP;

  Map<PolylineId, Polyline> polylines = {};

  static const LatLng sourceLocation =
      LatLng(20.993187360611337, 105.85492805668704);
  static const LatLng destination =
      LatLng(21.001741367307254, 105.85512117572738);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  LocationData? preLocation;
  Uint8List? icon;

  @override
  void initState() {
    super.initState();
    initIcon();
    getLocationUpdates().then(
      (_) => {
        getPolylinePoints(sourceLocation.latitude, sourceLocation.longitude)
            .then((coordinates) => {
                  generatePolyLineFromPoints(coordinates),
                }),
      },
    );
  }

  void initIcon() async {
    ByteData? byteData = await Utils.loadNetworkImage('https://s.net.vn/TkKq');
    if (byteData == null) {
      icon = null;
    } else {
      icon = await MarkersWithLabel.getBytesFromCanvasDynamic(
        dataStart: byteData /*'assets/images/img_robot.png'*/,
        plateReg: "robot",
        fontSize: 30,
        iconSize: const Size(100, 200),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: (_currentP == null || icon == null)
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              /*onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),*/
              initialCameraPosition: CameraPosition(
                target: LatLng(_currentP!.latitude, _currentP!.longitude),
                zoom: 15,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId("_sourceLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: sourceLocation,
                ),
                Marker(
                  markerId: const MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.fromBytes(icon!),
                  position: _currentP!,
                ),
                const Marker(
                  markerId: MarkerId("_destionationLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: destination,
                )
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos, double bearing) async {
    final GoogleMapController controller = await _mapController.future;
    double zoomLevel = await controller.getZoomLevel();
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: zoomLevel,
      bearing: bearing,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    /*_locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        /*getPolylinePoints(currentLocation.latitude!, currentLocation.longitude!)
            .then((coordinates) => {
                  generatePolyLineFromPoints(coordinates),
                });*/
        if (mounted) {
          setState(() {
            _currentP =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
            if (preLocation == null) {
              _cameraToPosition(_currentP!, currentLocation.heading!);
            } else {
              _cameraToPosition(_currentP!, preLocation!.heading!);
              preLocation = currentLocation;
            }
          });
        }
      }
    });*/
  }

  Future<List<LatLng>> getPolylinePoints(
      double latitude, double longitude) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        AppConfig.android_googleapi_key,
        PointLatLng(latitude, longitude),
        PointLatLng(destination.latitude, destination.longitude),
        //travelMode: TravelMode.driving,
      );
      print("1");
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(
            LatLng(
              point.latitude,
              point.longitude,
            ),
          );
        });
      } else {
        print(result.errorMessage);
      }
    } catch (error) {
      print(error);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 8,
    );
    if (mounted) {
      setState(() {
        polylines[id] = polyline;
      });
    }
  }
}*/
