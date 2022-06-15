



/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter06/Screens/messageDetail.dart';
import 'package:flutter06/Services/messageservice.dart';
import 'package:firebase_auth/firebase_auth.dart';

dynamic chatidlist;
CollectionReference userrefrencer =
    FirebaseFirestore.instance.collection("user");

class messagesall extends StatelessWidget {
  String currentuser = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    dynamic value;
    //AuthService().signUpemail("email@gmail.com", "password02");
    //messageservice().getcreateconversationid(
    //   "6rYsZ1a8HtcSPN8OS5eISZaYEI72", "yZUMMT6vjoQzqMBwMN04zQd51Bu2");
    //messageservice().uploadMessage(
    // "4YjCLg9ba9pBDMstzmgh", "some message from the othre side");

    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<List<dynamic>>(
          stream: messageservice().getstreamconvos(currentuser),
          builder: (context, snaps) {
            if (snaps.hasData) {
              //list of chat ids that have the uid stated above
              chatidlist = snaps.data!;
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
                  return Text("nothing to show");
                }
              },
            );
          },
        ),
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
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(userdata["imageurl"]),
                    ),
                    Text(userdata["username"])
                  ],
                ),
              );
            } else {
              return Text("nada my bradaa");
            }
          },
        );
      },
    );
  }
}







MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/aa.jpg"),
                ),
                title: Text("Abel Geregzaber"),
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/aa.jpg"),
                ),
                title: Text("Abel Geregzaber"),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );

    //get single userid from one chatid... specifically the userid that isnt me
String getuserid(String chatid) {
  String uid = "df";
  FirebaseFirestore.instance
      .collection("Conversations")
      .doc(chatid)
      .get()
      .then((value) {
    List users;
    
    if (value.data()!.isNotEmpty) {
      users = value.data()!["users"];

      for (String every in users) {
        if (every != "user01uid") {
          uid = every;
        }
      }
    }
  }).catchError((error) {
    print(error);
  });
  return uid;
}

FutureBuilder(
      future: messageservice().getuseridfromchatid("aIiwIH7nhbGJLWnQVBGk"),
      builder: (context, snaps) {
        if (snaps.hasData) {
          final value = snaps.data!;
          print(value);
        } else {
          print("didnt get it... there is none");
        }
        return Container();
      },
    );
 */