import 'package:favorite_list_place/providers/great_places.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text('Got no places yet, start adding some!'),
        ),
        builder: (ctx, gratePlaces, ch) => gratePlaces.items.length <= 0
            ? ch!
            : ListView.builder(
                itemCount: gratePlaces.items.length,
                itemBuilder: (Ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      gratePlaces.items[i].image,
                    ),
                  ),
                  title: Text(gratePlaces.items[i].title),
                  onTap: () {
                    //go to detail Page ...
                  },
                ),
              ),
      ),
    );
  }
}
