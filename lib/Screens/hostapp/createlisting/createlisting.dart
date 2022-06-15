import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:flutter06/Screens/hostapp/createlisting/housedescription.dart';
import 'package:flutter06/Screens/hostapp/createlisting/housetypepage.dart';
import 'package:flutter06/Screens/hostapp/createlisting/photoupload.dart';
import 'package:flutter06/reservations.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uuid/uuid.dart';
import 'housedetailpage.dart';

class createlistingbttombar extends StatelessWidget {
  const createlistingbttombar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: crtlstng(),
    );
  }
}

class crtlstng extends StatefulWidget {
  @override
  State<crtlstng> createState() => _crtlstngState();
}

class _crtlstngState extends State<crtlstng> {
  CollectionReference houserefrencer =
      FirebaseFirestore.instance.collection("House_Listing");
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          //app bar
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 20, 50),
            height: heightscreen * 0.2,
            color: theprimarycolor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                      size: 20,
                    )),
                SizedBox(
                  width: 8,
                ),
                if (pageindex == 0) ...[
                  Text(
                    "House Detail",
                    style: header16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "montserrat"),
                  )
                ] else if (pageindex == 1) ...[
                  Text(
                    "House Type",
                    style: header16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "montserrat"),
                  )
                ] else if (pageindex == 2) ...[
                  Text(
                    "House Description",
                    style: header16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "montserrat"),
                  )
                ] else if (pageindex == 3) ...[
                  Text(
                    "Upload Photos",
                    style: header16.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "montserrat"),
                  )
                ],
              ],
            ),
          ),
          //content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255)),
              height: heightscreen * 0.8,
              child: Stack(
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          //content
                          Container(
                              padding: EdgeInsets.fromLTRB(26, 120, 26, 20),
                              child: createlistingnewbar(pageindex))
                        ],
                      )
                    ],
                  ),
                  //tab bars
                  Container(
                    height: heightscreen * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          topLeft: Radius.circular(22),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255)),
                    padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          height: 6,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: theprimarycolor),
                        ),
                        SizedBox(
                          height: 24,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (pageindex == 0) ...[
                              circlenumbersnew("1", true)
                            ] else ...[
                              circlenumbersnew("1", false)
                            ],
                            SizedBox(
                              width: 14,
                            ),
                            if (pageindex == 1) ...[
                              circlenumbersnew("2", true)
                            ] else ...[
                              circlenumbersnew("2", false)
                            ],
                            SizedBox(
                              width: 14,
                            ),
                            if (pageindex == 2) ...[
                              circlenumbersnew("3", true)
                            ] else ...[
                              circlenumbersnew("3", false)
                            ],
                            SizedBox(
                              width: 14,
                            ),
                            if (pageindex == 3) ...[
                              circlenumbersnew("4", true)
                            ] else ...[
                              circlenumbersnew("4", false)
                            ]
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        //bottom slider
                        AnimatedSmoothIndicator(
                          activeIndex: pageindex,
                          count: 4,
                          effect: ScrollingDotsEffect(
                              activeDotColor: Colors.deepOrange,
                              dotColor: textcolorsecondary,
                              dotHeight: 3,
                              dotWidth: 46),
                        )
                      ],
                    ),
                  ),
                  //navigators
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: pageindex <= 2
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          pageindex -= 1;
                                        });
                                      },
                                      child: iconcircle(
                                          Icons.arrow_back_ios_new_outlined)),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        pageindex += 1;
                                      });
                                    },
                                    child: Container(
                                      decoration: linedboxdec,
                                      padding:
                                          EdgeInsets.fromLTRB(62, 12, 62, 12),
                                      child: Text(
                                        "Continue",
                                        style: header16.copyWith(
                                            color: theprimarycolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          pageindex += 1;
                                        });
                                      },
                                      child: iconcircle(
                                          Icons.arrow_forward_ios_outlined))
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          pageindex -= 1;
                                        });
                                      },
                                      icon: Icon(
                                          Icons.arrow_back_ios_new_outlined)),
                                  InkWell(
                                    onTap: () {
                                      var randuid = Uuid();
                                      var id = randuid.v4();

                                      HouseListing finalhouselisting = HouseListing(
                                          uid: "uid",
                                          title: title,
                                          amenities: selectedamenities,
                                          description: description,
                                          houserules: selectedhouseruleslist,
                                          housespecifications:
                                              "${selectedguests}Guests ${bedroomslist.length}Bedrooms ${selectedbathrooms}Bathrooms",
                                          location:
                                              "${selectedcity}, ${selectedstreet}",
                                          price: int.parse(pricepernight),
                                          rating: 0,
                                          subtitle: title,
                                          imageurl: uploadedurlimageslist,
                                          bedrooms: finalbedroomslist,
                                          houseuid: id);

                                      //add to genral houselistings databse
                                      houserefrencer
                                          .doc(id)
                                          .set(finalhouselisting.tojson());
                                      //update users hosted houselisting
                                      FirebaseFirestore.instance
                                          .collection(
                                              "user/$myuid/hostedlistings")
                                          .doc(id)
                                          .set({"houseuid": id});
                                    },
                                    child: Container(
                                      decoration: linedboxdec,
                                      padding:
                                          EdgeInsets.fromLTRB(62, 12, 62, 12),
                                      child: Text(
                                        "Create Listing",
                                        style: header16.copyWith(
                                            color: theprimarycolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class createlistingnewbar extends StatefulWidget {
  int pageindex;
  createlistingnewbar(this.pageindex);

  @override
  State<createlistingnewbar> createState() => _createlistingnewbarState();
}

class _createlistingnewbarState extends State<createlistingnewbar> {
  @override
  Widget build(BuildContext context) {
    if (widget.pageindex == 0) {
      return housedetailpage();
    } else if (widget.pageindex == 1) {
      return housetypepage();
    } else if (widget.pageindex == 2) {
      return housedescpage();
    } else {
      return photouploadpage();
    }
  }
}

class circlenumbersnew extends StatelessWidget {
  String text;
  bool iscurrent;
  circlenumbersnew(this.text, this.iscurrent);

  @override
  Widget build(BuildContext context) {
    return iscurrent
        ? Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: theprimarycolor),
            child: Center(
              child: Text(
                text,
                style: header14.copyWith(color: Colors.white),
              ),
            ),
          )
        : Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: textcolorsecondary),
            child: Center(
              child: Text(
                text,
                style: header14.copyWith(color: Colors.white),
              ),
            ),
          );
  }
}

class iconcircle extends StatelessWidget {
  IconData icon;
  iconcircle(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(shape: BoxShape.circle, color: theprimarycolor),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}


/**
 class createlisting extends StatelessWidget {
  const createlisting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              height: 300,
              color: theprimarycolor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(
                    "House Detail",
                    style: header16.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(22),
                      topLeft: Radius.circular(22),
                    ),
                    color: Color.fromARGB(255, 54, 174, 244)),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 570,
                child: Column(
                  children: [
                    //tab bar
                    SizedBox(
                      height: 20,
                    ),
                    createlistingtabbar()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class createlistingtabbar extends StatefulWidget {
  const createlistingtabbar({Key? key}) : super(key: key);

  @override
  State<createlistingtabbar> createState() => _createlistingtabbarState();
}

class _createlistingtabbarState extends State<createlistingtabbar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              bottom: PreferredSize(
                preferredSize: Size(200, 0),
                child: Container(
                  width: 200,
                  child: TabBar(
                      indicatorColor: textcolorprimary,
                      indicatorWeight: 4,
                      labelStyle: header16,
                      labelColor: textcolorprimary,
                      labelPadding: EdgeInsets.zero,
                      unselectedLabelColor: textcolorsecondary,
                      unselectedLabelStyle: header16.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w600),
                      tabs: [
                        Tab(
                          child: circlenumbers("1"),
                        ),
                        Tab(
                          child: circlenumbers("2"),
                        ),
                        Tab(
                          child: circlenumbers("3"),
                        ),
                        Tab(
                          child: circlenumbers("4"),
                        ),
                      ]),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                housedetailpage(),
                housetypepage(),
                housedescpage(),
                photouploadpage()
              ],
            ),
          )),
    );
  }
}




 * if (widget.pageindex == 0) ...[
              housedetailpage()
            ] else if (widget.pageindex == 1) ...[
              housetypepage()
            ] else if (widget.pageindex == 2) ...[
              housedescpage()
            ] else if (widget.pageindex == 3) ...[
              photouploadpage()
            ]
 

class bedroomslistview extends StatefulWidget {
  int nums;
  bedroomslistview(this.nums);

  @override
  State<bedroomslistview> createState() => _bedroomslistviewState();
}

class _bedroomslistviewState extends State<bedroomslistview> {
  int beds = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.nums,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Room $beds"),
                  InkWell(
                      onTap: () {
                        setState(() {
                          widget.nums -= 1;
                        });
                      },
                      child: Icon(Icons.cancel))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Queen",
                    style: header12medium,
                  ),
                  counternums(beds)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "King",
                    style: header12medium,
                  ),
                  counternums(beds)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Normal",
                    style: header12medium,
                  ),
                  counternums(beds)
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}

 */