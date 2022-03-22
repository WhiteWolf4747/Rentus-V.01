import 'package:flutter/material.dart';
import 'main.dart';
import 'listingdetailpage.dart';
import 'searchpagemap.dart';

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
          fontFamily: "poppins",
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          primaryColor: Colors.deepOrange),
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
                              Icon(
                                Icons.menu,
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
                                        fontSize: 32,
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
                                  ),
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

class locationEachBlocks extends StatelessWidget {
  final String imageloc;
  final String locTitle;

  locationEachBlocks(this.imageloc, this.locTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          image:
              DecorationImage(image: AssetImage(imageloc), fit: BoxFit.cover)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 0, 0, 0.15),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          Text(
            locTitle,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class locationscrollview extends StatelessWidget {
  const locationscrollview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          locationEachBlocks("assets/aa.jpg", " Addis\nAbaba"),
          SizedBox(
            width: 20,
          ),
          locationEachBlocks("assets/axum.jpg", "Axum"),
          SizedBox(
            width: 20,
          ),
          locationEachBlocks("assets/lalibela.jpg", "Lalibela"),
          SizedBox(
            width: 20,
          ),
          locationEachBlocks("assets/lalibela.jpg", "Lalibela")
        ],
      ),
    );
  }
}

class featuredEachBlocks extends StatelessWidget {
  final String featuredImage;
  final String featuredRating;
  final String featuredTitle;
  final String featuredprice;

  featuredEachBlocks(this.featuredImage, this.featuredRating,
      this.featuredTitle, this.featuredprice);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => listingdetail())),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: 175,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(featuredImage), fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              Positioned(
                  bottom: -15,
                  right: 10,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("assets/Joker.jpg"),
                  ))
            ],
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 4),
              width: 75,
              child: Image(image: AssetImage(featuredRating))),
          Container(
            width: 175,
            height: 35,
            child: Text(
              featuredTitle,
              style: TextStyle(
                  height: 1.2,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              featuredprice,
              style: TextStyle(
                  height: 1.1,
                  fontSize: 16,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
