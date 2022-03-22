import 'package:flutter/material.dart';
import 'package:flutter06/main.dart';
import 'home.dart';

class listingdetail extends StatelessWidget {
  const listingdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "abel",
      home: Scaffold(
          body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                child: Column(
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
                                color: Colors.deepOrange,
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
                        "assets/Joker.jpg",
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
                                    fontFamily: "poppins",
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),

                              //---- Rating(as u can see this whole row is useless u can use actual pics that individual icons)
                              //rating
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 26.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 26.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 26.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 26.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 170, 170, 170),
                                    size: 26.0,
                                  )
                                ],
                              ),
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
                                children: const [
                                  //---- price
                                  Text("\$29/",
                                      style: TextStyle(
                                          fontFamily: "poppins",
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange)),
                                  Text(
                                    "night",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.deepOrange),
                                  )
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
                                    fontSize: 16.0,
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
                                  Text("Addis Ababa, Ethiopia",
                                      style: TextStyle(
                                        fontFamily: "poppins",
                                      )),
                                  //---- "guests.rooms.beds.bathroom..."
                                  Text("2guests 1bathroom 3bedroom 2 bed",
                                      style: TextStyle(
                                        fontFamily: "poppins",
                                      )),
                                  //---- Host name
                                  Text("Hosted by Abebe bekila",
                                      style: TextStyle(
                                        fontFamily: "poppins",
                                      ))
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 14.0, 0, 10.0),
                            child: Text("Description:",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 95, 95, 95))),
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
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),

                          //---- Amenitites list/row
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //amenities boxes
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Wifi",
                                        style: TextStyle(
                                            fontFamily: "poppins",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Icon(
                                        Icons.wifi,
                                        size: 24.0,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Kitchenstu",
                                        style: TextStyle(
                                            fontFamily: "poppins",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Icon(
                                        Icons.kitchen_outlined,
                                        size: 24.0,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Washers",
                                        style: TextStyle(
                                            fontFamily: "poppins",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Icon(
                                        Icons.wallet_giftcard_sharp,
                                        size: 24.0,
                                      )
                                    ],
                                  ),
                                )

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
                                      fontFamily: "poppins",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              Text("see more",
                                  style: TextStyle(
                                      fontFamily: "poppins",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange))
                            ],
                          ), //title
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text("4.5 reviews")
                              ],
                            ),
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
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
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
                          //vertical 3 blocks
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //individual blocks
                              Container(
                                width: 175.0,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment:
                                            AlignmentDirectional.bottomEnd,
                                        overflow: Overflow.visible,
                                        children: [
                                          Container(
                                            height: 150,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              child: Image(
                                                  image: AssetImage(
                                                      "assets/Joker.jpg")),
                                            ),
                                          ),
                                          Positioned(
                                              bottom: -12,
                                              right: 10,
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage(
                                                    "assets/loc.jpg"),
                                              )),
                                        ],
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 8, 0, 6),
                                        child: Image.asset(
                                          "assets/four.jpg",
                                          height: 12,
                                        ),
                                      ),
                                      Text(
                                        "Entire Luxury altirm apartment",
                                        style: TextStyle(
                                            height: 1.1,
                                            fontFamily: "poppins",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("\$29 birr ",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepOrange)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 175.0,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment:
                                            AlignmentDirectional.bottomEnd,
                                        overflow: Overflow.visible,
                                        children: [
                                          Container(
                                            height: 150,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              child: Image(
                                                  image: AssetImage(
                                                      "assets/Joker.jpg")),
                                            ),
                                          ),
                                          Positioned(
                                              bottom: -12,
                                              right: 10,
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage(
                                                    "assets/loc.jpg"),
                                              )),
                                        ],
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 8, 0, 6),
                                        child: Image.asset(
                                          "assets/four.jpg",
                                          height: 12,
                                        ),
                                      ),
                                      Text(
                                        "Entire Luxury altirm apartment",
                                        style: TextStyle(
                                            height: 1.1,
                                            fontFamily: "poppins",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("\$29 birr ",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepOrange)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ], //outer list
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    primary: Colors.deepOrange),
                onPressed: () {
                  statefullhome();
                },
                child: const Text(
                  'Reserve Now ',
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
