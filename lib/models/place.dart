import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latitude;
  final double langitude;
  final String? address;

  const PlaceLocation({
    required this.latitude,
    required this.langitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;
  Place({
    required this.id,
    required this.title,
    this.location,
    required this.image,
  });
}
