import 'package:flutter/material.dart';
import 'splashScreen.dart';
import 'home.dart';
import 'searchpage.dart';
import 'msgNotifications.dart';
import 'profile.dart';
import 'favourites.dart';

void main() {
  runApp(splashhomepage());
}

class statefullhome extends StatefulWidget {
  const statefullhome({Key? key}) : super(key: key);

  @override
  State<statefullhome> createState() => _statefullhomeState();
}

class _statefullhomeState extends State<statefullhome> {
  int currentindex = 0;
  final pages = [
    myhomepagefirst(),
    favouritesPage(),
    searchpage(),
    msgNotpage(),
    profilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Abel",
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.deepOrange,
            selectedLabelStyle: TextStyle(
                fontFamily: "montserrat", fontWeight: FontWeight.bold),
            currentIndex: currentindex,
            onTap: (index) => setState(() => currentindex = index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Saved"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined), label: "Map"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Inbox"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
          ),
          body: pages[currentindex]),
    );
  }
}
