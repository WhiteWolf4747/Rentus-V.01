import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';

class commentsection extends StatelessWidget {
  String housuid;
  commentsection(this.housuid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("House_Listing/$housuid/comments")
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snaps) {
        if (snaps.hasData) {
          if (snaps.data!.docs.length == 0) {
            return Row(
              children: [
                Icon(Icons.comment_outlined),
                Text(
                  "No Comments yet",
                  style: header14,
                ),
              ],
            );
          }
          return ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: snaps.data!.docs.map((DocumentSnapshot document) {
              //individual comment object/uid
              dynamic value = document.data();

              return commentsectiondetail(value["comment"], value["uid"]);
            }).toList(),
          );
        } else if (snaps.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColorLight,
          ));
        }
        return Container();
      },
    );
  }
}

class commentsectiondetail extends StatelessWidget {
  String comment;
  String useruid;
  commentsectiondetail(this.comment, this.useruid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance
          .collection("user")
          .doc("6rYsZ1a8HtcSPN8OS5eISZaYEI72")
          .get(),
      builder: (context, snaps) {
        if (snaps.hasData) {
          return commentindividual(comment, snaps.data!.data()!["imageurl"],
              snaps.data!.data()!["username"]);
        }
        return Container();
      },
    );
  }
}

class commentindividual extends StatelessWidget {
  String username;
  String imageurl;
  String comment;

  commentindividual(this.comment, this.imageurl, this.username);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
                radius: 28.0,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username, style: header14),
                  Image.asset(
                    "assets/5star01.png",
                    height: 18,
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(76, 8.0, 0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment,
                style: header12medium,
              ),
              Text(
                "Dec 20 2012 8:00pm",
                style: header8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


/*
Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //profile
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageurl),
              radius: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Container(height: 20, child: Image.asset("assets/four.jpg"))
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        //comment
        Text(comment,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        //time
        Text("today 4 pm"),
        SizedBox(height: 10)
      ],
    );
 */
