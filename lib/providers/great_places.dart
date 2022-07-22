import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/place.dart';
import 'package:flutter/foundation.dart';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  void addPlace(
    String pickedTitle,
    File pickedImage,
    PlaceLocation pickedLocation,
  ) async {
    final address = await LocationHelper.getPlaceAddress(
        pickedLocation.latitude, pickedLocation.longitude);
    final updateLocation = PlaceLocation(
      latitude: pickedLocation.latitude,
      longitude: pickedLocation.longitude,
      address: address,
    );
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: updateLocation,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'loc_lat': newPlace.location!.latitude,
        'loc_lng': newPlace.location!.longitude,
        'address': newPlace.location!.address as Object,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    dataList
        .map(
          (item) => Place(
            id: item['id'].toString(),
            title: item['title'].toString(),
            image: File(item['image'].toString()),
            location: PlaceLocation(
              latitude: item['loc_lat'] as double,
              longitude: item['loc_lng'] as double,
              address: item['address'].toString(),
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
