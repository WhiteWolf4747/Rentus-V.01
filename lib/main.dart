import 'package:flutter/material.dart';
import 'package:flutter06/searchpagemap.dart';
import 'home.dart';
import 'listingdetailpage.dart';
import 'searchpage.dart';

void main() {
  runApp(statefullhome());
}

class statefullhome extends StatefulWidget {
  const statefullhome({Key? key}) : super(key: key);

  @override
  State<statefullhome> createState() => _statefullhomeState();
}

class _statefullhomeState extends State<statefullhome> {
  int currentindex = 0;
  final pages = [myhomepagefirst(), searchpage(), searchPageMap()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Abel",
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (index) => setState(() => currentindex = index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined), label: "Map"),
            ],
          ),
          body: pages[currentindex]),
    );
  }
}
