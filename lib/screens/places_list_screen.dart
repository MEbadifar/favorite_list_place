import 'package:favorite_list_place/providers/great_places.dart';
import 'package:favorite_list_place/screens/place_detail_screen.dart';
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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: ((context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : Consumer<GreatPlaces>(
                    child: const Center(
                        child: Text('Got no places yet, start adding some!')),
                    builder: (ctx, gratePlaces, ch) => gratePlaces.items.isEmpty
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
                              subtitle:
                                  Text(gratePlaces.items[i].location!.address!),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  PlaceDetailScreen.routeName,
                                  arguments: gratePlaces.items[i].id,
                                );
                              },
                            ),
                          ),
                  )),
      ),
    );
  }
}
