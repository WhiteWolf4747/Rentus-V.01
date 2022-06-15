import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:flutter06/Screens/favourites.dart';
import 'package:flutter06/Screens/hostapp/hostlistings.dart';
import 'package:flutter06/Screens/searchbarresults.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../shared/classes.dart';
import 'package:flutter06/Services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter06/Services/database.dart';
import 'package:flutter06/Services/featuredPlacesList.dart';
import 'listingdetailpage.dart';
import 'messagesAllView.dart';
import 'package:flutter06/shared/styles.dart';

List images = [
  "assets/topdisplay01.png",
  "assets/gondor05.jpg",
  "assets/hawassa02.png"
];

List foryoulist = [];

class myhomepagefirst extends StatelessWidget {
  const myhomepagefirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return StreamProvider<List<HouseListing>?>.value(
      initialData: null,
      value: databaseService("s").houseStream,
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
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
                              RichText(
                                  text: TextSpan(
                                      text: "Rent",
                                      style: header18bold.copyWith(
                                          fontFamily: "montserrat",
                                          fontSize: 24),
                                      children: [
                                    TextSpan(
                                        text: "US",
                                        style: header18bold.copyWith(
                                            fontFamily: "montserrat",
                                            fontSize: 24,
                                            color: Colors.white))
                                  ])),
                              Icon(
                                Icons.filter_list,
                                color: Colors.white,
                                size: 24,
                              )
                            ],
                          ),
                        )),
                    //everything below search
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                      color: Color.fromARGB(255, 241, 241, 241),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*
                         *ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            image: AssetImage("assets/topdisplay01.png"),
                            height: heightscreen * 0.2,
                            width: heightscreen * 0.2 * 2.9,
                          ),
                        ),
                         */
                          imagecarousel(),
                          SizedBox(
                            height: 28,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Locations",
                                    style: header18,
                                  ),
                                  Text(
                                    "View more",
                                    style: header12light,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 12,
                              ),

                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    locationoneblock("assets/aa02.png"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    locationoneblock("assets/lalibela02.png"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    locationoneblock("assets/hawassa02.png"),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    locationoneblock("assets/gondar02.png"),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 28,
                              ),

                              //foryou

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "For you",
                                    style: header18,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                  //for you stream
                                  foryoustream(),

                                  /**
                                 SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      featuresmaller(),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      featuresmaller(),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      featuresmaller(),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                 */
                                ],
                              ),

                              SizedBox(
                                height: 32,
                              ),

                              //featured places
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Featured",
                                    style: header18,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  featuredlist(),
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
                    top: 96,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => searchbarresul())),
                      child: Container(
                        width: widthscreen * 0.8,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 252, 252),
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(157, 157, 157, 0.14),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                              child: Icon(
                                Icons.search,
                                color: textcolorsecondary,
                                size: 28,
                              ),
                            ),
                            Text("Enter something here...",
                                style: header12light.copyWith(
                                    color: textcolorsecondary))
                          ],
                        ),
                      ),
                    )),
              ],
            ),

            //the whole page below search
          ],
        ),
      ),
      //eziga its sending data to the whole of home page... lets do it so it sends the data to the separate widgets... feautred lisr and location
    );
  }
}

class locationoneblock extends StatelessWidget {
  String imageloc;
  locationoneblock(this.imageloc);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image(
        image: AssetImage(imageloc),
        height: heightscreen * 0.14,
        width: heightscreen * 0.14,
      ),
    );
  }
}

class featuresmaller extends StatelessWidget {
  String imageurl;
  String location;
  featuresmaller(this.imageurl, this.location);

  @override
  Widget build(BuildContext context) {
    double _widthscreen = MediaQuery.of(context).size.width;
    double _heightscreen = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                height: _heightscreen * 0.17,
                width: _widthscreen * 0.34,
                image: NetworkImage(imageurl),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              location,
              style: header10,
            )
          ],
        ),
        Positioned(
          top: 10,
          child: Container(
            height: 24,
            width: 46,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 245, 175, 21),
                    Color.fromARGB(255, 241, 39, 17)
                  ],
                  tileMode: TileMode.repeated,
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: Center(
              child: Text(
                "New",
                style: header12light.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class imagecarousel extends StatefulWidget {
  const imagecarousel({Key? key}) : super(key: key);

  @override
  State<imagecarousel> createState() => _imagecarouselState();
}

class _imagecarouselState extends State<imagecarousel> {
  int activeindex = 0;

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
        children: [
          //carousel
          Container(
            height: heightscreen * 0.2,
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeindex = index;
                    });
                  }),
              itemBuilder: (context, index, realindex) {
                final individualimage = images[index];

                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      image: AssetImage(
                        individualimage,
                      ),
                      fit: BoxFit.contain),
                );
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          //bottom slider
          Positioned(
            bottom: 14,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
              child: AnimatedSmoothIndicator(
                activeIndex: activeindex,
                count: images.length,
                effect: ScrollingDotsEffect(
                    activeDotColor: Colors.deepOrange,
                    dotColor: Colors.white,
                    spacing: 16,
                    dotHeight: 3,
                    dotWidth: widthscreen / images.length * 0.75),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class foryoustream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Foryou").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snaps) {
        if (snaps.hasData) {
          for (DocumentSnapshot each in snaps.data!.docs) {
            dynamic val = each.data();
            foryoulist.add(val);
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: snaps.data!.docs.map((DocumentSnapshot document) {
                //individual houselisting object/uid
                dynamic value = document.data();
                print(foryoulist);
                return foryougetindividual(value["houseuid"]);
              }).toList(),
            ),
          );
        } else if (snaps.connectionState == ConnectionState.waiting ||
            snaps.connectionState == ConnectionState.active) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
          ));
        } else {
          return Text(
            "No reservations yet",
            style: header14,
          );
        }
      },
    );
  }
}

class foryougetindividual extends StatelessWidget {
  String houseid;
  foryougetindividual(this.houseid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HouseListing?>(
      future: databaseService("df").getsinglehouselisting(houseid),
      builder: (context, snaps) {
        if (snaps.hasData) {
          HouseListing rec = snaps.data!;
          print(rec.imageurl[0]);

          return InkWell(
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => listingdetail(houseid))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 16),
              child: featuresmaller(rec.imageurl[0], rec.location),
            ),
          );
        }
        return Container();
      },
    );
  }
}


/*

ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
        subject['images']['large'],
        height: 150.0,
        width: 100.0,
    ),
)

Scaffold(
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

      //location
                  FutureBuilder(
                    future: determinePosition(),
                    builder: (context, snaps) {
                      if (snaps.hasData) {
                        print(snaps.data);
                      } else {
                        print("No data");
                      }
                      return Container();
                    },
                  ),

          databaseService("uid").updateAkerayhouselistingData(
        "6rYsZ1a8HtcSPN8OS5eISZaYEI72",
        "title",
        "subtitile",
        4,
        "description",
        ["amenities"],
        "Addis ababa",
        ["houserules"],
        93,
        "https://firebasestorage.googleapis.com/v0/b/rentus02-39256.appspot.com/o/imagestest%2F02.jpeg?alt=media&token=65ccaaf3-3221-48db-8458-ddd0d9ecd6f9");
    databaseService("uid").adduserfavourites(
        "EdlEDfU9reRpnWay9kjz", "6rYsZ1a8HtcSPN8OS5eISZaYEI72");

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
                                // just make a fucking image carusel idiot
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
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ],
                            )),

                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  messagesall()));
                                    },
                                    child: Text("Messages")),
                                ElevatedButton(
                                    onPressed: () => AuthService().signOut(),
                                    child: Text("Sign out")),


ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            image: AssetImage("assets/topdisplay01.png"),
                            height: heightscreen * 0.2,
                            width: heightscreen * 0.2 * 2.9,
                          ),
                        ),
                
 */
