import 'package:flutter/material.dart';
import 'classes.dart';

class house {
  String title = "Entire 2bedroom is aprtment complex";
  String subtitle = "Stylish modern 2bedrrom in city center";
  double rating = 4.0;
  String description =
      "Stylish modern 2bedrrom in city center.Stylish modern 2bedrrom in city centerStylish modern 2bedrrom in city center";
  int price = 29;
  String image = "assets/house03.jpg";
}

house house01 = new house();

class myhomepagefirst extends StatelessWidget {
  const myhomepagefirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: textfont,
          primaryColor: primarycolor,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 32),
              headline2: TextStyle(fontSize: 28))),
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: [
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
                                Icons.notifications_active_outlined,
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
                              Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.white,
                                size: 32,
                              )
                            ],
                          ),
                        )),
                    //everything below search
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                      color: Color.fromARGB(255, 241, 241, 241),
                      child: Column(
                        children: [
                          //top displayer
                          Container(
                              height: 140,
                              width: 360,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/aa.jpg"),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      height: 150,
                                      width: 360,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Color.fromRGBO(255, 60, 0, 0.25),
                                              Color.fromRGBO(15, 7, 65, 0.55)
                                            ],
                                            tileMode: TileMode.repeated,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Be anywhere \nAnytime",
                                      style: TextStyle(
                                        height: 1,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ],
                              )),

                          SizedBox(
                            height: 32,
                          ),

                          //Locations
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Locations",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 15, 7, 65),
                                    ),
                                  ),
                                  Text(
                                    "View more",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 97, 97, 97),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              locationscrollview(),

                              SizedBox(
                                height: 32,
                              ),
                              //for u block
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "For you",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 15, 7, 65),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  //scrollview
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        smallerfeaturedblock(),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        smallerfeaturedblock(),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        smallerfeaturedblock(),
                                        SizedBox(
                                          width: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 24,
                              ),

                              //featured places
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Featured",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 15, 7, 65),
                                      ),
                                    ),
                                  ),
                                  //the two blocks
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //the one blick
                                      featuredEachBlocks(
                                          house01.image,
                                          "assets/four.jpg",
                                          house01.title,
                                          house01.price.toString()),
                                      featuredEachBlocks(
                                          "assets/house01.jpg",
                                          "assets/four.jpg",
                                          house01.title,
                                          "\$32")
                                    ],
                                  ),

                                  SizedBox(
                                    height: 24,
                                  )
                                ],
                              )
                            ],
                          )
                        ], //end to main page
                      ),
                    ),
                  ],
                ),
                Positioned(
                    //searchbar
                    top: 90,
                    child: Container(
                      width: 360,
                      height: 52,
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

            //the whole page below search
          ],
        ),
      ),
    );
  }
}
