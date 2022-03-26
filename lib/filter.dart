import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter06/home.dart';
import 'classes.dart';

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
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey))),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 28),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(Icons.arrow_back_ios_new_sharp)),
                          Text(" Filter Search",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //price range
                    Text(
                      "Price Range",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
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
                    //slider price
                    sliderprice(),
                    //min max text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Min",
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          "Max",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //amenities
                    Text(
                      "Amenities",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
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
                      height: 24,
                    ),
                    //types of places

                    Text(
                      "Types of places",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      height: 24,
                    ),

                    //locations
                    Text(
                      "Locations",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
