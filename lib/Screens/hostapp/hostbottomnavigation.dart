import 'package:flutter/material.dart';
import 'package:flutter06/Screens/favourites.dart';
import 'package:flutter06/Screens/home.dart';
import 'package:flutter06/Screens/hostapp/hostlistings.dart';
import 'package:flutter06/Screens/hostapp/hostprofile.dart';
import 'package:flutter06/reservations.dart';
import 'package:flutter06/Screens/msgNotifications.dart';
import 'package:flutter06/Screens/profile.dart';
import 'package:flutter06/reservations.dart';
import 'package:flutter06/searchpage.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:device_preview/device_preview.dart';

class hostbottomnavigationbar extends StatefulWidget {
  const hostbottomnavigationbar({Key? key}) : super(key: key);

  @override
  State<hostbottomnavigationbar> createState() =>
      _hostbottomnavigationbarState();
}

class _hostbottomnavigationbarState extends State<hostbottomnavigationbar> {
  int currentindex = 0;
  final pages = [
    reservations("hostreservationconfirmed", "hostreservationpending"),
    hostlistings(),
    messagenotificationspage(),
    hostprofilePage()
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
                  icon: Icon(Icons.bookmark_add_outlined), label: "Bookings"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline, size: 28),
                  label: "Listings"),
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
