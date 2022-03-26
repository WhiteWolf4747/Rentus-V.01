import 'package:flutter/material.dart';
import 'classes.dart';
import 'filter.dart';
import 'package:flutter06/main.dart';
import 'package:flutter06/listingdetailpage.dart';

class searchpage extends StatelessWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: textfont,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          primaryColor: primarycolor),
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: [
                //main page without searchbar
                Column(
                  children: [
                    Container(
                        height: 120,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          height: 75,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(255, 238, 214, 0),
                                Color.fromARGB(255, 255, 60, 0)
                              ],
                              tileMode: TileMode.repeated,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.notification_important_outlined,
                                color: Colors.white,
                                size: 32,
                              ),
                              Text(
                                "Rentus",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => filterSheet())),
                                child: Icon(
                                  Icons.filter_alt_outlined,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              )
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
                            height: 10,
                          ),
                          //number of items
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "50 items",
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Featured",
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          //the two blocks
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //the one blick
                              featuredEachBlocks("assets/house01.jpg",
                                  "assets/four.jpg", house01.title, "34"),

                              featuredEachBlocks("assets/house02.jpg",
                                  "assets/four.jpg", house01.title, "94")
                            ],
                          ),
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
                    top: 90,
                    child: Container(
                      width: 360,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 252, 252),
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 201, 201, 201),
                                blurRadius: 51.0)
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 32,
                            ),
                          ),
                          Text("Enter something here...",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 172, 172, 172),
                              ))
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
