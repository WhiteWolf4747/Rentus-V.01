import 'package:flutter/material.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:flutter06/Screens/hostapp/createlisting/createlisting.dart';
import 'package:flutter06/Screens/listingdetailpage.dart';
import 'package:flutter06/Screens/searchbarresults.dart';
import 'package:flutter06/Services/database.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String houseuid = "";

class hostlistings extends StatelessWidget {
  const hostlistings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "poppins"),
      home: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 50, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " Your Listings",
                              style: header16,
                            ),
                            Icon(Icons.add)
                          ],
                        ),
                      ),
                      Divider(
                        color: linecolor,
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
                Container(
                    color: lightgrey,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: hostlistingstream("thisid")),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => createlistingbttombar()));
                      },
                      child: buttonWide(60, "Create Listing", crtlstng()))),
            )
          ],
        ),
      ),
    );
  }
}

class hostlistingstream extends StatelessWidget {
  String thisid;
  hostlistingstream(this.thisid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("user/6rYsZ1a8HtcSPN8OS5eISZaYEI72/hostedlistings")
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snaps) {
        if (snaps.hasData) {
          return ListView(
            shrinkWrap: true,
            children: snaps.data!.docs.map((DocumentSnapshot document) {
              //individual houselisting object/uid
              dynamic value = document.data();
              houseuid = value["houseuid"];
              print(value["houseuid"]);
              return hostindividual(value["houseuid"]);
            }).toList(),
          );
        }
        return Container();
      },
    );
  }
}

class hostindividual extends StatelessWidget {
  String houseid;
  hostindividual(this.houseid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HouseListing?>(
      future: databaseService("df").getsinglehouselisting(houseid),
      builder: (context, snaps) {
        if (snaps.hasData) {
          HouseListing rec = snaps.data!;

          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: favOneBlocknew(rec.imageurl[0], rec.location,
                "assets/5star01.png", rec.subtitle),
          );
        }
        return Container();
      },
    );
  }
}

class favOneBlocknew extends StatelessWidget {
  final String favImage;
  final String favTitle;
  final String favRating;
  final String favLocation;

  favOneBlocknew(
      this.favImage, this.favLocation, this.favRating, this.favTitle);

  @override
  Widget build(BuildContext context) {
    double _screenwidth = getScreenWidth(context);
    double _screenheight = getScreenHeight(context);
    print(_screenwidth);
    return Container(
      width: double.infinity,
      height: _screenheight * 0.17,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: linecolor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: NetworkImage(favImage),
                width: _screenwidth * 0.2,
                height: _screenheight * 0.15,
                fit: BoxFit.cover,
              )),
          SizedBox(width: 20),
          SizedBox(
            width: _screenwidth * 0.44,
            child: Text(
              favTitle,
              style: header12bold,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(width: 6),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => listingdetail(houseuid))),
            child: Icon(
              Icons.preview_outlined,
              color: textcolorsecondary,
            ),
          )
        ],
      ),
    );
  }
}
