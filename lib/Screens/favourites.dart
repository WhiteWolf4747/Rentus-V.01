import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:flutter06/Screens/searchbarresults.dart';
import 'package:flutter06/Services/database.dart';
import 'package:flutter06/shared/styles.dart';
import '../shared/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final myuid = FirebaseAuth.instance.currentUser!.uid;

class favouritesPage extends StatelessWidget {
  const favouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 0, 20),
                    child: Text(
                      " Favourites",
                      style: header16,
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
                child: favouritesstream()),
          ],
        ),
      ),
    );
  }
}

class favouritesstream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("user/$myuid/favourites")
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snaps) {
        if (snaps.hasData) {
          if (snaps.data!.docs.length == 0) {
            return Text(
              "No Favouorites yet",
              style: header14,
            );
          }
          return ListView(
            shrinkWrap: true,
            children: snaps.data!.docs.map((DocumentSnapshot document) {
              //individual houselisting object/uid
              dynamic value = document.data();
              print(value["houseuid"]);
              return favouritesindividual(value["houseuid"]);
            }).toList(),
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

class favouritesindividual extends StatelessWidget {
  String houseid;
  favouritesindividual(this.houseid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HouseListing?>(
      future: databaseService("df").getsinglehouselisting(houseid),
      builder: (context, snaps) {
        if (snaps.hasData) {
          HouseListing rec = snaps.data!;

          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: favOneBlock(rec.imageurl[0], rec.location,
                "assets/5star01.png", rec.subtitle, rec.houseuid),
          );
        }
        return Container();
      },
    );
  }
}
