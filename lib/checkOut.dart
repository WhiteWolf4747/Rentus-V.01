import 'package:flutter/material.dart';
import 'package:flutter06/home.dart';
import 'classes.dart';

class checkOutpage extends StatelessWidget {
  const checkOutpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "montserrat"),
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 211, 211, 211)),
                      )),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => print("pop"),
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              size: 28,
                            ),
                          ),
                          Text(
                            " Your Cart",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),

                    //top displayer
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromARGB(255, 221, 221, 221)),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: EdgeInsets.all(14),
                      child: Wrap(
                        spacing: 20,
                        children: [
                          Image(
                            image: AssetImage("assets/house01.jpg"),
                            width: 100,
                          ),
                          Column(
                            //the 3 descriptions
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Stylish 2 bedroom fll the thin",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Image(
                                  image: AssetImage("assets/four.jpg"),
                                  width: 80,
                                ),
                              ),
                              Text(
                                "Addis Ababa, Ethiopia",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),

                    //date and guest displayer
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: Color.fromARGB(255, 221, 221, 221)),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.all(14),
                        child: Column(
                          children: [
                            //the one row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "May 24 - 26",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Guests",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "1 Adult. 2 Children",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        )),

                    SizedBox(
                      height: 24,
                    ),

                    //price displayer
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: Color.fromARGB(255, 221, 221, 221)),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.all(14),
                        child: Column(
                          children: [
                            //the one row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Stay for 2 Nights",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "2 x 45",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cleaning Fee",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "34",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tax Fee",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Fee",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "\$284",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primarycolor,
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: buttonWide(60, "RESERVE NOW", myhomepagefirst()))
          ],
        ),
      )),
    );
  }
}
