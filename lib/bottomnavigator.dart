import 'package:flutter/material.dart';
import 'package:flutter06/searchpage.dart';
import 'package:flutter06/shared/styles.dart';
import 'searchpagemap.dart';
import 'Screens/home.dart';
import 'Screens/msgNotifications.dart';
import 'Screens/profile.dart';
import 'Screens/favourites.dart';
import 'package:device_preview/device_preview.dart';
import 'reservations.dart';

class bottomnavigationbar extends StatefulWidget {
  const bottomnavigationbar({Key? key}) : super(key: key);

  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar> {
  int currentindex = 0;
  final pages = [
    myhomepagefirst(),
    favouritesPage(),
    reservations("userreservationconfirmed", "userreservationpending"),
    messagenotificationspage(),
    profilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Abel",
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Color.fromARGB(255, 99, 104, 128),
            selectedItemColor: Colors.deepOrange,
            selectedLabelStyle: header10.copyWith(
                fontFamily: "montserrat", fontWeight: FontWeight.bold),
            showUnselectedLabels: true,
            unselectedLabelStyle: header10.copyWith(
                fontFamily: "montserrat", color: textcolorsecondary),
            currentIndex: currentindex,
            onTap: (index) => setState(() => currentindex = index),
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                    child: Icon(
                      Icons.home_outlined,
                      size: 32,
                    ),
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline, size: 28), label: "Saved"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_add_outlined, size: 28),
                  label: "Bookings"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.inbox_outlined, size: 28), label: "Inbox"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 28), label: "Profile")
            ],
          ),
          body: pages[currentindex]),
    );
  }
}
