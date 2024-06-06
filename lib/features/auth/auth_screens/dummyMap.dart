import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DummyMap extends StatefulWidget {
  const DummyMap({super.key});

  @override
  State<DummyMap> createState() => _DummyMapState();
}

class _DummyMapState extends State<DummyMap> {
  Completer<GoogleMapController> googleCtrl = Completer();

  static final CameraPosition position = const CameraPosition(
    target: LatLng(29.867367, 77.375344),
    zoom: 16.4746,
  );

  List<Marker> _marker = [];
  List<Marker> _listMarker = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(29.867367, 77.375344),
      infoWindow: InfoWindow(title: "MY Home"),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(29.867357, 77.375344),
      infoWindow: InfoWindow(title: "MY Home"),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_listMarker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Dummy map"),
      // ),
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        // myLocationEnabled: true,
        mapType: MapType.normal,
        // compassEnabled: true,
        initialCameraPosition: position,
        onMapCreated: (GoogleMapController controller) {
          googleCtrl.complete(controller);
        },
      ),
    );
  }
}
