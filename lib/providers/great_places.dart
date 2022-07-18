import 'package:flutter/cupertino.dart';

import '../models/place.dart';
import 'package:flutter/foundation.dart';


class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }
}
