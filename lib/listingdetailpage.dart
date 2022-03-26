import 'package:flutter/material.dart';
import 'package:flutter06/home.dart';

import 'classes.dart';

class listingdetail extends StatelessWidget {
  const listingdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "abel",
      theme: ThemeData(fontFamily: textfont, primaryColor: primarycolor),
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20),
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: primarycolor,
                                size: 32,
                              ),
                              onTap: () => Navigator.of(context).pop(),
                            ),

                            //---- Main title
                            Text(
                              " some kind of data tha say stuff...",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.search,
                              size: 30.0,
                            ),
                            Icon(
                              Icons.more_vert_rounded,
                              size: 30.0,
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(
                      height: 24.0,
                    ),

                    //---- picture
                    //picture
                    Container(
                      width: 400.0,
                      height: 200.0,
                      child: Image.asset(
                        "assets/house01.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),

                    //slideshow

                    //subtitle
                    Container(
                      height: 95.0,
                      margin: EdgeInsets.fromLTRB(0, 24.0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //---- Subtitle
                              Text(
                                "Something about it is in\nsth and it is true ",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),

                              //---- Rating(as u can see this whole row is useless u can use actual pics that individual icons)
                              //rating
                              Container(
                                  height: 28,
                                  child: Image.asset("assets/four.jpg"))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.share),
                              ),
                              Row(
                                children: [
                                  //---- price
                                  Text("\$29 ",
                                      style: TextStyle(
                                          fontFamily: "poppins",
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: primarycolor)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    //place description
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
                            child: Text("Place informations:",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //---- host profile picture
                              //profilepic
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/Joker.jpg"),
                                radius: 40.0,
                              ),

                              //3 informations
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //---- Location
                                  Text("Addis Ababa, Ethiopia"),
                                  //---- "guests.rooms.beds.bathroom..."
                                  Text("2guests 1bathroom 3bedroom 2 bed"),
                                  //---- Host name
                                  Text("Hosted by Abebe bekila")
                                ],
                              )
                            ],
                          ),

                          //house rules title
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "House Rules",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "See more",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primarycolor),
                                )
                              ],
                            ),
                          ),

                          //house rules
                          Column(
                            children: [
                              houseRules(
                                  Icons.door_front_door_outlined,
                                  "Smoking is ",
                                  "Wifi is Allowed not allowed in this area"),
                              SizedBox(
                                height: 10,
                              ),
                              houseRules(Icons.pets, "Pets are allowed ",
                                  "Pets allowed in the vecinity in the area of the world "),
                              SizedBox(
                                height: 10,
                              ),
                              houseRules(Icons.timelapse_outlined, "Chekin ",
                                  "Pets allowed in the vecinity in the area of the world "),
                              SizedBox(
                                height: 10,
                              ),
                              houseRules(
                                  Icons.not_interested_rounded,
                                  "No blobs allowed ",
                                  "n the area of the world of the making is the way")
                            ],
                          ),

                          SizedBox(
                            height: 24,
                          ),

                          Text("Description:",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 95, 95, 95))),
                          SizedBox(
                            height: 8,
                          ),
                          //---- Description
                          Text(
                              "somethign about sth is the name for the whole stick things now how will it go we shall see if it is thers sticksdfdas abel is my name and this is more blabla and are those tihngs libraries ",
                              style: TextStyle(
                                fontFamily: "poppins",
                              ))
                        ],
                      ),
                    ),

                    //amenities
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 24.0, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Amenitites",
                                  style: TextStyle(
                                      fontFamily: "poppins",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                              Text("see more",
                                  style: TextStyle(
                                      fontFamily: "poppins",
                                      fontSize: 14.0,
                                      color: primarycolor,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),

                          //---- Amenitites scroll view
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                //amenities boxes
                                CustomAmenitiesChip(" Wifi", Icons.wifi),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomAmenitiesChip(
                                    " Kitchen", Icons.kitchen_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomAmenitiesChip(
                                    " Parking", Icons.local_parking_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomAmenitiesChip(" Wifi", Icons.wifi),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomAmenitiesChip(" Wifi", Icons.wifi),
                                SizedBox(
                                  width: 10,
                                ),

                                //amenites circles end
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    //---- Location in map
                    //map
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250.0,
                            width: 400.0,
                            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                            color: Colors.amber,
                            child: Image.asset(
                              "assets/map.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Exact location is procided after booking.",
                            style: TextStyle(
                                fontFamily: "poppins", fontSize: 16.0),
                          )
                        ]),
                    //---- coment/rating section
                    //review places
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 24.0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Review Place",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              Text("see more",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: primarycolor))
                            ],
                          ), //title
                          Row(
                            children: [
                              Image.asset(
                                "assets/four.jpg",
                                height: 24,
                              ),
                              Text("4.5 reviews")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/Joker.jpg"),
                                radius: 30.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Abebe Bekila",
                                        style: TextStyle(
                                            fontFamily: "poppins",
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    Image.asset(
                                      "assets/four.jpg",
                                      height: 24,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                            child: Text(
                              "somethign about sth is the name for the whole stick things now how will it go we shall see if it is thers sticksdfdas abel is my name and this is more blabla and are those tihngs libraries",
                              style: TextStyle(fontFamily: "poppins"),
                            ),
                          ),
                          Text("December 22 2020 ")
                        ],
                      ),
                    ),
                    //---- Other similar house listings shown in the below format
                    //feautured places
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 24.0, 0, 100.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 14.0),
                            child: Text("Title",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          //featured scroll view
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                //individual blocks
                                featuredEachBlocks("assets/house03.jpg",
                                    "assets/four.jpg", "house01.title", "\$74"),
                                SizedBox(
                                  width: 20,
                                ),
                                featuredEachBlocks("assets/house03.jpg",
                                    "assets/four.jpg", "house01.title", "\$74"),
                                SizedBox(
                                  width: 20,
                                ),
                                featuredEachBlocks("assets/house03.jpg",
                                    "assets/four.jpg", "house01.title", "\$74"),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ], //outer list
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
