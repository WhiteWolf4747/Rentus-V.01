import 'package:flutter/material.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:flutter06/Screens/checkOut.dart';
import 'package:flutter06/bottomnavigator.dart';
import 'package:flutter06/Services/database.dart';
import 'package:flutter06/reviewDetail.dart';
import 'package:flutter06/shared/styles.dart';
import '../shared/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'commentsection.dart';
import 'package:flutter06/amenitieshouserules.dart';

DateTimeRange initdate =
    DateTimeRange(start: DateTime(2022, 01, 02), end: DateTime(2022, 02, 02));

class listingdetail extends StatelessWidget {
  listingdetail(this.houseuid);
  final String houseuid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<HouseListing?>(
        future: databaseService("").getsinglehouselisting(houseuid),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            final houselistingobj = snapshots.data!;
            print(houselistingobj.title);
            return listingdetailstack(houselistingobj);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class listingdetailstack extends StatefulWidget {
  final HouseListing houseobj;
  listingdetailstack(this.houseobj);

  @override
  State<listingdetailstack> createState() => _listingdetailstackState();
}

class _listingdetailstackState extends State<listingdetailstack> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = getScreenWidth(context);
    double screenheight = getScreenHeight(context);

    return Stack(
      children: [
        ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: Row(
                    //header
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: textcolorsecondary,
                              size: 20,
                            ),
                            onTap: () => Navigator.of(context).pop(),
                          ),

                          //---- Main title
                          SizedBox(
                            width: screenwidth * 0.66,
                            child: Text(
                              "   ${widget.houseobj.title}",
                              style: header14,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 28.0,
                            color: textcolorsecondary,
                          ),
                          Icon(
                            Icons.more_vert_rounded,
                            size: 28.0,
                            color: textcolorsecondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //---- picture
                //picture
                imagecarousel(widget.houseobj.imageurl),

                //all below picture
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 95.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //---- Subtitle

                                  Text(
                                    widget.houseobj.subtitle,
                                    style: header18bold.copyWith(height: 1.5),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),

                                  //---- Rating(as u can see this whole row is useless u can use actual pics that individual icons)
                                  //rating
                                  Container(
                                      height: 20,
                                      child: Image.asset("assets/5star01.png"))
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 0, 8, 0),
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: textcolorsecondary,
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "\$29",
                                        style: header16.copyWith(
                                            color: theprimarycolor),
                                        children: [
                                      TextSpan(text: " /night", style: header10)
                                    ]))
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
                                  const EdgeInsets.fromLTRB(0, 28.0, 0, 14.0),
                              child:
                                  Text("Place informations:", style: header14),
                            ),

                            FutureBuilder<Map<String, dynamic>?>(
                              future: databaseService("")
                                  .getuserinfo(widget.houseobj.uid),
                              builder: (context, snap) {
                                if (snap.hasData) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //---- host profile picture
                                      //profilepic
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            snap.data!["imageurl"]),
                                        radius: 38.0,
                                      ),
                                      //3 informations
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          //---- Location
                                          Text(
                                            widget.houseobj.location,
                                            style: header12medium,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          //---- "guests.rooms.beds.bathroom..."
                                          Text(
                                            "2guests 1bathroom 3bedroom 2 bed",
                                            style: header12medium,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          //---- Host name
                                          Text(
                                            "Hosted by ${snap.data!["username"]} ",
                                            style: header12medium,
                                          )
                                        ],
                                      )
                                    ],
                                  );
                                }
                                return Container();
                              },
                            ),
                            SizedBox(
                              height: 28,
                            ),

                            Text("Where you will stay:", style: header14),

                            SizedBox(
                              height: 20,
                            ),
                            //individual room

                            Container(
                              height: 190,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.houseobj.bedrooms.length,
                                  itemBuilder: (BuildContext, index) {
                                    print(screenheight);
                                    return Row(
                                      children: [
                                        individualroom(
                                            widget.houseobj.bedrooms[index]
                                                ["bedType"],
                                            widget.houseobj.bedrooms[index]
                                                ["imageUrl"],
                                            widget.houseobj.bedrooms[index]
                                                ["roomNumber"]),
                                        SizedBox(
                                          width: 30,
                                        )
                                      ],
                                    );
                                  }),
                            ),

                            SizedBox(
                              height: 28,
                            ),
                            Text("Description:", style: header14),
                            SizedBox(
                              height: 14,
                            ),
                            //---- Description
                            Text(
                              widget.houseobj.description,
                              style: header12medium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),

                      //amenities
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 28.0, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amenitites", style: header14),
                                Text("See more",
                                    style: header12bold.copyWith(
                                        color: theprimarycolor))
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Container(
                                height: 100,
                                child: amenitiesall(widget.houseobj.amenities))
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
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              color: Colors.amber,
                              child: Image.asset(
                                "assets/map.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Exact location is procided after booking.",
                              style: TextStyle(fontFamily: "poppins"),
                            )
                          ]),

                      //house rules title
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 28, 0, 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "House Rules",
                              style: header14,
                            ),
                            Text("See more",
                                style: header12bold.copyWith(
                                    color: theprimarycolor))
                          ],
                        ),
                      ),

                      //house rules
                      houserulesview(widget.houseobj.houserules),
                      //---- coment/rating section
                      //review places
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 28.0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Review Place", style: header14),
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => reviewpage())),
                                  child: Text("see more",
                                      style: header12bold.copyWith(
                                          color: theprimarycolor)),
                                ),
                              ],
                            ), //title
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/5star01.png",
                                    height: 18,
                                  ),
                                  Text(
                                    "    4.5 reviews",
                                    style: header10,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),

                            commentsection("housuid"),
                          ],
                        ),
                      ),
                      //---- Other similar house listings shown in the below format
                      //feautured places
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16.0, 0, 100.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Same places", style: header14),

                            SizedBox(
                              height: 24,
                            ),
                            //featured scroll view
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  //individual blocks

                                  featuredEachBlocks(
                                      "assets/house03.jpg",
                                      "assets/four.jpg",
                                      "Something sth is sth with sth and sth",
                                      "\$74"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  featuredEachBlocks(
                                      "assets/house03.jpg",
                                      "assets/four.jpg",
                                      "house of lord voldomort and his pot",
                                      "\$74"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  featuredEachBlocks(
                                      "assets/house03.jpg",
                                      "assets/four.jpg",
                                      "house01.title is some title of the house",
                                      "\$74"),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ], //outer list
            ),
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                decoration: buttonshadow,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: buttonWide(60, "RESERVE NOW",
                    checkOutpage("houseuid", widget.houseobj))))
      ],
    );
  }
}

//----

class imagecarousel extends StatefulWidget {
  List imagesurl;
  imagecarousel(this.imagesurl);

  @override
  State<imagecarousel> createState() => _imagecarouselState();
}

class _imagecarouselState extends State<imagecarousel> {
  int activeindex = 0;

  @override
  Widget build(BuildContext context) {
    double _screenwidth = getScreenWidth(context);
    double _screenheight = getScreenHeight(context);
    return Center(
      child: Column(
        children: [
          //carousel
          CarouselSlider.builder(
            itemCount: widget.imagesurl.length,
            options: CarouselOptions(
                height: _screenheight * 0.36,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeindex = index;
                  });
                }),
            itemBuilder: (context, index, realindex) {
              final individualimage = widget.imagesurl[index];

              return Container(
                  width: 400,
                  color: Colors.grey,
                  child: Image(
                    image: NetworkImage(
                      individualimage,
                    ),
                    fit: BoxFit.cover,
                  ));
            },
          ),
          SizedBox(
            height: 16,
          ),
          //bottom slider
          AnimatedSmoothIndicator(
            activeIndex: activeindex,
            count: widget.imagesurl.length,
            effect: ScrollingDotsEffect(
                activeDotColor: Colors.deepOrange,
                dotColor: textcolorsecondary,
                dotHeight: 8,
                dotWidth: 8),
          )
        ],
      ),
    );
  }
}

class individualroom extends StatelessWidget {
  String imageurl;
  String bedtype;
  String bedroomnumber;

  individualroom(this.bedtype, this.imageurl, this.bedroomnumber);

  @override
  Widget build(BuildContext context) {
    double screenwidth = getScreenWidth(context);
    double screenheight = getScreenHeight(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: screenheight * 0.20,
          width: screenwidth * 0.38,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: Text(bedroomnumber, style: header12bold),
        ),
        Text(bedtype, style: header10)
      ],
    );
  }
}
