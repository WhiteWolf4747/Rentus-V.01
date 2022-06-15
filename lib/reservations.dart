import 'package:flutter/material.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter06/Screens/messageDetail.dart';
import 'package:flutter06/Services/messageservice.dart';
import 'package:firebase_auth/firebase_auth.dart';

//double x = MediaQuery.of(context).size.width;
final myuid = FirebaseAuth.instance.currentUser!.uid;

class reservations extends StatelessWidget {
  String userorhouseconfirmed;
  String userorhousepending;

  reservations(this.userorhouseconfirmed, this.userorhousepending);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                shape: Border(bottom: BorderSide(color: textcolorprimary)),
                elevation: 0,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                bottom: TabBar(
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
                        child: Text(
                          "Confirmed",
                        ),
                      ),
                      Tab(
                        child: Text(
                          " Pending",
                        ),
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                reservationconfirmedpage(userorhouseconfirmed),
                reservationpendingpage(userorhousepending),
              ]),
            )),
      )),
    );
  }
}

class reservationconfirmedpage extends StatelessWidget {
  String userorhouseconfirmed;
  reservationconfirmedpage(this.userorhouseconfirmed);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("user/$myuid/$userorhouseconfirmed")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snaps) {
              if (snaps.hasData) {
                if (snaps.data!.docs.length == 0) {
                  return Text(
                    "No reservations yet",
                    style: header14,
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  children: snaps.data!.docs.map((DocumentSnapshot document) {
                    //individual reservation object
                    dynamic value = document.data();

                    return reservationconfirmed(
                        value["housetitle"],
                        value["datefrom"],
                        value["dateto"],
                        value["guests"].toString());
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
                print("ond");
                return Text(
                  "No reservations yet",
                  style: header14,
                );
              }
            }));
  }
}

class reservationconfirmed extends StatelessWidget {
  String title;
  String datefrom;
  String dateto;
  String guests;
  reservationconfirmed(this.title, this.datefrom, this.dateto, this.guests);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: heightscreen * 0.17,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: linecolor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: widthscreen * 0.6,
                child: Text(
                  title,
                  style: header12bold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Icon(Icons.cancel)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Rent Duration: ",
                      style: header12medium.copyWith(color: textcolorprimary),
                      children: [
                    TextSpan(text: "$datefrom - $dateto", style: header8)
                  ])),
              RichText(
                  text: TextSpan(
                      text: "Guests: ",
                      style: header12medium.copyWith(color: textcolorprimary),
                      children: [TextSpan(text: guests, style: header8)])),
            ],
          ),
        ],
      ),
    );
  }
}

class reservationpendingpage extends StatelessWidget {
  String userorhousepending;
  reservationpendingpage(this.userorhousepending);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("user/$myuid/$userorhousepending")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snaps) {
              if (snaps.hasData) {
                if (snaps.data!.docs.length == 0) {
                  return Text(
                    "No reservations yet",
                    style: header14,
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  children: snaps.data!.docs.map((DocumentSnapshot document) {
                    //individual reservation object
                    dynamic value = document.data();

                    return reservationpending(
                        value["reservationuid"],
                        value["reserveruid"],
                        value["housetitle"],
                        value["datefrom"],
                        value["dateto"],
                        value["guests"].toString());
                  }).toList(),
                );
              } else if (snaps.connectionState == ConnectionState.waiting) {
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
            }));
  }
}

class reservationpending extends StatelessWidget {
  String reservationuid;
  String reserveruid;
  String title;
  String datefrom;
  String dateto;
  String guests;
  reservationpending(this.reservationuid, this.reserveruid, this.title,
      this.datefrom, this.dateto, this.guests);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: heightscreen * 0.17,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: linecolor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: widthscreen * 0.44,
                child: Text(
                  title,
                  style: header12bold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Rent Duration: ",
                          style:
                              header12medium.copyWith(color: textcolorprimary),
                          children: [
                        TextSpan(
                            text: "${datefrom} - ${dateto}", style: header8)
                      ])),
                  RichText(
                      text: TextSpan(
                          text: "Guests: ",
                          style:
                              header12medium.copyWith(color: textcolorprimary),
                          children: [TextSpan(text: guests, style: header8)])),
                ],
              )
            ],
          ),
          //---
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.cancel),
              ElevatedButton(
                  onPressed: () async {
                    //first copy the reservation to confirmed one
                    final snap = await FirebaseFirestore.instance
                        .collection("user/$myuid/hostreservationpending")
                        .doc(reservationuid)
                        .get();
                    if (snap.exists) {
                      await FirebaseFirestore.instance
                          .collection("user/$myuid/hostreservationconfirmed")
                          .doc(reservationuid)
                          .set(snap.data()!);
                    }
                    //delete the pending reservation
                    FirebaseFirestore.instance
                        .collection("user/$myuid/hostreservationpending")
                        .doc(reservationuid)
                        .delete();

                    confirmreservationforrenter(reservationuid, reserveruid);
                  },
                  child: Text("Accept"),
                  style: ElevatedButton.styleFrom(
                    primary: theprimarycolor,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

Future confirmreservationforrenter(reservationuid, useruid) async {
  //first copy the reservation to confirmed one
  final snap = await FirebaseFirestore.instance
      .collection("user/$useruid/userreservationpending")
      .doc(reservationuid)
      .get();
  if (snap.exists) {
    await FirebaseFirestore.instance
        .collection("user/$useruid/userreservationconfirmed")
        .doc(reservationuid)
        .set(snap.data()!);
  }
  //delete the pending reservation
  FirebaseFirestore.instance
      .collection("user/$useruid/userreservationpending")
      .doc(reservationuid)
      .delete();
}
