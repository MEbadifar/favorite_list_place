import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final bool isSelecting;
  final PlaceLocation initialLiocation;

  const MapScreen(
 {   Key? key,
    this.isSelecting=false,
    this.initialLiocation=const PlaceLocation(latitude: 37.422, langitude: -122.084),
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('your Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLiocation.latitude,
            widget.initialLiocation.langitude,
          ),
          zoom: 16,
        ),
      ),
    );
  }
}
