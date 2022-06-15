import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter06/Screens/home.dart';
import 'package:flutter06/shared/styles.dart';
import '../shared/classes.dart';

class filterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "montserrat"),
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //top bar
                    backandtitlebtn("Filter"),
                    SizedBox(
                      height: 20,
                    ),

                    //price range
                    Text(
                      "Price Range",
                      style: header14,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: textfieldinput(Icons.attach_money, "2234"),
                        ),
                        Container(
                          width: 150,
                          child: textfieldinput(Icons.attach_money, "2234"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    //slider price
                    sliderprice(),
                    //min max text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Min",
                          style:
                              header12bold.copyWith(color: textcolorsecondary),
                        ),
                        Text(
                          "Max",
                          style:
                              header12bold.copyWith(color: textcolorsecondary),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    //amenities
                    Text(
                      "Amenities",
                      style: header14,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 15.0,
                      children: [
                        filterChip("Wifi"),
                        filterChip("Washers"),
                        filterChip("filterChipTitle"),
                        filterChip("something")
                      ],
                    ),

                    SizedBox(
                      height: 28,
                    ),
                    //types of places

                    Text(
                      "Types of places",
                      style: header14,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 15.0,
                      children: [
                        filterChip("Apartment"),
                        filterChip("Bed and Breakfast"),
                        filterChip("Villa"),
                        filterChip("Luxury"),
                        filterChip("room")
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),

                    //locations
                    Text(
                      "Locations",
                      style: header14,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 15.0,
                      children: [
                        filterChip("Apartment"),
                        filterChip("Bed and Breakfast"),
                        filterChip("Villa"),
                        filterChip("Luxury"),
                        filterChip("room")
                      ],
                    ),

                    SizedBox(
                      height: 80,
                    )
                    //column end
                  ],
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: buttonWide(60, "APPLY CHANGES", myhomepagefirst()))
          ],
        ),
      )),
    );
  }
}
