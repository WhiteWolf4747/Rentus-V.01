import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter06/reservations.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:intl/intl.dart';

class notificationspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user/$myuid/notifications")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snaps) {
          if (snaps.hasData) {
            if (snaps.data!.docs.length == 0) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Text(
                  "No Notifiactions yet",
                  style: header14,
                ),
              );
            }
            //list of chat ids that have the uid stated above
            dynamic notification = snaps.data!;

            return Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ListView(
                    shrinkWrap: true,
                    children: snaps.data!.docs.map((DocumentSnapshot document) {
                      //individual message object
                      dynamic value = document.data();

                      return notificationindividual(
                          notificationcontent: value["notification"],
                          createdon: value["createdon"]);
                    }).toList()));
          } else if (snaps.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorLight,
            ));
          } else {
            return Text(
              "No reservations yet",
              style: header14,
            );
          }
          //converts chat ids to the user ids that had conversations with
        },
      ),
    );
  }
}

class notificationindividual extends StatelessWidget {
  String notificationcontent;
  Timestamp createdon;

  notificationindividual(
      {required this.notificationcontent, required this.createdon});

  @override
  Widget build(BuildContext context) {
    DateTime thedate = createdon.toDate();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(thedate);
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/logo02.png"),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          //message content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //content
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 8),
                  child: Text(
                    notificationcontent,
                    style: header12medium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                Text(
                  formattedDate,
                  style: header10.copyWith(color: textcolorprimary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
