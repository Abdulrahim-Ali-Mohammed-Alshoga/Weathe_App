import 'package:flutter/material.dart';
import 'package:weather_app/constants/name_pages.dart';

class ListSavedAreasScreen extends StatefulWidget {
  const ListSavedAreasScreen({Key? key}) : super(key: key);

  @override
  State<ListSavedAreasScreen> createState() => _ListSavedAreasScreenState();
}

class _ListSavedAreasScreenState extends State<ListSavedAreasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favorites",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.deepOrange),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context,NamePage.searchScreen);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.deepOrange,
                ))
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 120,
                color: Colors.blueAccent,
                child: Stack(
                  fit: StackFit.expand,
                  children: [Positioned(
                      top: 15,left: 15,child: Text("Current location",style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18
                  ),))],
                ),
              )
            ],
          ),
        ));
  }
}
