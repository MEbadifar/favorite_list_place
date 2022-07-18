import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/place.dart';
import 'package:flutter/foundation.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
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
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
