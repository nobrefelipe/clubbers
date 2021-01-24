import 'dart:collection';

import 'package:clubbers/app/api/mock/locals.dart';
import 'package:clubbers/app/api/models/local_model.dart';
import 'package:clubbers/app/shared/components/FavoritePlaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  /*
    GET NEARBY PLACES
    
  */
  List<Local> nearByPlaces;

  /*
    INITIAL CAMERA POSITION
    This is where the map will be centered first
  */
  CameraPosition _initialCameraPosition;

  /*
    PAGE  CONTROLLER
  */
  PageController _pageController = PageController(viewportFraction: 0.6);

  /*
    MAP CONTROLLER
  */
  GoogleMapController _mapController;

  Set<Circle> circles;

  /*
    GET USERs CURRENT LOCATION
  */

  // Service enable?
  bool _serviceEnabled;
  // Permission Status
  LocationPermission _permissionGranted;
  // location Data
  Position _locationData;

  void _getlocation() async {
    // Check if location service is enabled
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check if we have permission to geolocate the user
    _permissionGranted = await Geolocator.checkPermission();
    // If the user denies it forever, exit
    if (_permissionGranted == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permantly denied, we cannot request permissions.');
    }

    // If the user denies it
    if (_permissionGranted == LocationPermission.denied) {
      // Lets request it again
      _permissionGranted = await Geolocator.requestPermission();
      // If the user doenst allow it, exit
      if (_permissionGranted != LocationPermission.whileInUse && _permissionGranted != LocationPermission.always) {
        return Future.error('Location permissions are denied (actual value: $_permissionGranted).');
      }
    }

    // Set the user's current location data
    _locationData = await Geolocator.getCurrentPosition();

    nearByPlaces = locals
        .where((local) => _calculateDistanceBetween(local.position.latitude, local.position.longitude) <= 5000)
        .toList();

    /*
      After getting the user's current location
      lets center the map at the user's position
    */
    _initialCameraPosition = CameraPosition(
      target: LatLng(_locationData.latitude, _locationData.longitude),
      zoom: 14,
    );

    // circles = Set.from(
    //   [
    //     Circle(
    //       circleId: CircleId("id"),
    //       center: LatLng(_locationData.latitude, _locationData.longitude),
    //       radius: 1000,
    //       fillColor: Colors.blue.withOpacity(0.3),
    //       strokeWidth: 2,
    //       strokeColor: Colors.blue,
    //     ),
    //   ],
    // );
    // Call setState to rebuild the view
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Get user's location
    _getlocation();
    // Set map markers
    _setMarkerIcon();

    _pageController.addListener(() {
      var markerId = _pageController.page.roundToDouble().toInt();

      if (_pageController.page == _pageController.page.roundToDouble()) {
        _mapController
          ..animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: locals[markerId].position,
                zoom: 14,
              ),
            ),
          )
          ..showMarkerInfoWindow(MarkerId(markerId.toString()));
      }
    });
  }

  /*
    SET MAP STYLE
    This function will load a json file with custom stylings for the map
    and will load it on _onMapCreated()
  */
  void _setMapStyle() async {
    String style = await DefaultAssetBundle.of(context).loadString('lib/assets/map_style.json');
    _mapController.setMapStyle(style);
  }

  /*
    MARKER ICON
  */
  BitmapDescriptor _markerIcon;
  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'lib/assets/img/marker.png');
  }

  /*
    DEFINE MARKERS
  */
  Set<Marker> _markers = HashSet<Marker>();

  /*
    ON MAP CREATED
  */
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    /*
      For now lets use set state to add markers.
      When I start to implemnte getx controllers this logic will be handled by a controller
    */

    setState(
      () {
        nearByPlaces.forEach((local) {
          _markers.add(
            Marker(
              markerId: MarkerId(local.id),
              position: local.position,
              icon: _markerIcon,
              infoWindow: InfoWindow(
                title: local.name,
                snippet: local.description,
              ),
            ),
          );
        });

        /*
          SET THE MAP STYLE
          Current using dark map style
        */
        _setMapStyle();
      },
    );
  }

  double _calculateDistanceBetween(double toLat, double toLng) {
    return Geolocator.distanceBetween(
      _locationData.latitude,
      _locationData.longitude,
      toLat,
      toLng,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: (_locationData != null)
            ? Stack(
                children: [
                  //
                  // MAP
                  //
                  Positioned.fill(
                    child: GoogleMap(
                      // On Map Created
                      onMapCreated: _onMapCreated,
                      // Initial Camera Pocition
                      initialCameraPosition: _initialCameraPosition,
                      // Markers
                      markers: _markers,
                      // Enable Current Location
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      circles: circles,
                    ),
                  ),
                  //
                  // PLACES
                  //
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: FavoritePlaces(
                      places: nearByPlaces,
                      controller: _pageController,
                    ),
                  ),
                ],
              )
            : Container(color: Colors.black),
      ),
    );
  }
}
