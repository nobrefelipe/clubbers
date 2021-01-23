import 'dart:collection';

import 'package:clubbers/app/api/mock/locals.dart';
import 'package:clubbers/app/shared/components/FavoritePlaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  /*
    MAP CONTROLLER
  */
  GoogleMapController _mapController;

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
    INITIAL CAMERA POSITION
    This is where the map will be centered first
  */
  final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-25.4458076, -49.2835635),
    zoom: 16,
  );

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
        _markers.add(
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(-25.4458076, -49.2835635),
            icon: _markerIcon,
            infoWindow: InfoWindow(
              title: "Cafe Della Music",
              snippet: "E Aqui!",
            ),
          ),
        );
        /*
          SET THE MAP STYLE
          Current using dark map style
        */
        _setMapStyle();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
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
              ),
            ),
            //
            // PLACES
            //
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: FavoritePlaces(places: locals),
            ),
          ],
        ),
      ),
    );
  }
}
