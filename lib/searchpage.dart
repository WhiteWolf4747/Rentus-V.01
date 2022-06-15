import 'package:flutter/material.dart';
import 'package:flutter06/Services/featuredPlacesList.dart';
import 'package:flutter06/shared/styles.dart';
import 'shared/classes.dart';
import 'Screens/filter.dart';
import 'package:flutter06/main.dart';
import 'package:flutter06/Screens/listingdetailpage.dart';

class searchpage extends StatelessWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                //main page without searchbar
                Column(
                  children: [
                    Container(
                        height: 120,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          height: 75,
                          decoration: orangegradient,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.notification_important_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: "Rent",
                                          style: header12bold.copyWith(
                                              fontFamily: "montserrat",
                                              color: textcolorprimary),
                                          children: [
                                        TextSpan(
                                            text: "US",
                                            style: header12bold.copyWith(
                                                fontFamily: "montserrat",
                                                color: Colors.white))
                                      ])),
                                  Text(
                                    "Addis Ababa",
                                    style:
                                        header18.copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                              InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => filterSheet())),
                                  child: Icon(
                                    Icons.filter_list,
                                    color: Colors.white,
                                    size: 24,
                                  )),
                            ],
                          ),
                        )),

                    //whole page below search
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                      color: Color.fromARGB(255, 243, 243, 243),
                      child: Column(
                        children: [
                          //filters
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                catagoriesFilterChip("Wifi"),
                                SizedBox(
                                  width: 10,
                                ),
                                catagoriesFilterChip("something"),
                                SizedBox(
                                  width: 10,
                                ),
                                catagoriesFilterChip("wifi"),
                                SizedBox(
                                  width: 10,
                                ),
                                catagoriesFilterChip("apartment"),
                                SizedBox(
                                  width: 10,
                                ),
                                catagoriesFilterChip("title"),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //number of items
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "50 items",
                                style: header14,
                              ),
                              Text(
                                "Featured",
                                style: header14light,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          //the two blocks
                          featuredlist(),
                          SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    //searchbar
                    top: 96,
                    child: customsearchbar()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
