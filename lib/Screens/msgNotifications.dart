import 'package:flutter/material.dart';
import 'package:flutter06/Screens/notifications.dart';
import 'package:flutter06/shared/styles.dart';
import '../shared/classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter06/Screens/messageDetail.dart';
import 'package:flutter06/Services/messageservice.dart';
import 'package:firebase_auth/firebase_auth.dart';

//double x = MediaQuery.of(context).size.width;

class messagenotificationspage extends StatelessWidget {
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
                          "Messages",
                        ),
                      ),
                      Tab(
                        child: Text(
                          " Notification",
                        ),
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                messagesall(),
                notificationspage(),
              ]),
            )),
      )),
    );
  }
}

dynamic chatidlist;
CollectionReference userrefrencer =
    FirebaseFirestore.instance.collection("user");

class messagesall extends StatelessWidget {
  String currentuser = FirebaseAuth.instance.currentUser!.uid;

  //

  @override
  Widget build(BuildContext context) {
    dynamic value;
    print(currentuser);
    //AuthService().signUpemail("email@gmail.com", "password02");
    //messageservice().getcreateconversationid(
    //   "6rYsZ1a8HtcSPN8OS5eISZaYEI72", "yZUMMT6vjoQzqMBwMN04zQd51Bu2");
    //messageservice().uploadMessage(
    // "4YjCLg9ba9pBDMstzmgh", "some message from the othre side");

    return Scaffold(
      body: StreamBuilder<List<dynamic>>(
        stream: messageservice().getstreamconvos(currentuser),
        builder: (context, snaps) {
          if (snaps.hasData) {
            if (snaps.data!.length == 0) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Text(
                  "No Messages yet",
                  style: header14,
                ),
              );
            }
            //list of chat ids that have the uid stated above
            chatidlist = snaps.data!;
          } else if (snaps.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorLight,
            ));
          } else {
            return Text(
              "No Messages yet",
              style: header14,
            );
          }
          //converts chat ids to the user ids that had conversations with
          return FutureBuilder(
            future: messageservice().getuseridfromchatidlist(chatidlist),
            builder: (context, snaps) {
              if (snaps.hasData) {
                dynamic useridlist = snaps.data!;
                print(useridlist);

                return messagesallview(useridlist);
              } else {
                print("Nothing to shw");
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}

//views all user data that uv had convos with... got the list of convos from stream above
class messagesallview extends StatelessWidget {
  List userslist;
  messagesallview(this.userslist);

  @override
  Widget build(BuildContext context) {
    //dispayes all user from the list
    return ListView.builder(
      itemCount: userslist.length,
      itemBuilder: (context, index) {
        return FutureBuilder(
          //take the uid and return there data
          future: userrefrencer.doc(userslist[index]).get(),
          builder: (context, snaps) {
            if (snaps.hasData) {
              dynamic userdata = snaps.data;

              return InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => messagesdetail(
                            theotheruid: userslist[index],
                          )));
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    messageoneprofilenew(
                        imageurl: userdata["imageurl"],
                        username: userdata["username"]),
                  ],
                ),
              );
            } else {
              print("Nothing to shw");
              return Container();
            }
          },
        );
      },
    );
  }
}



/*

class msgprofiles extends StatelessWidget {
  const msgprofiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            msgOneProfile(),
            SizedBox(
              height: 12,
            ),
            msgOneProfile(),
            SizedBox(
              height: 18,
            ),
            msgOneProfile(),
            SizedBox(
              height: 18,
            ),
          ],
        )
      ],
    );
  }
} 
*/