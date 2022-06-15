import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter06/Services/messageservice.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter06/shared/classes.dart';

import '../shared/styles.dart';

String myuid = FirebaseAuth.instance.currentUser!.uid;
final _controller = TextEditingController();
String message = "";

class messagesdetail extends StatefulWidget {
  const messagesdetail({Key? key, required this.theotheruid}) : super(key: key);

  final String theotheruid;

  @override
  State<messagesdetail> createState() => _messagesdetailState();
}

class _messagesdetailState extends State<messagesdetail> {
  @override
  Widget build(BuildContext context) {
    String myuid = FirebaseAuth.instance.currentUser!.uid;

    print(myuid);
    print(widget.theotheruid);

    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future:
            messageservice().getcreateconversationid(myuid, widget.theotheruid),
        builder: (context, snaps) {
          if (snaps.hasData) {
            //chat id put into here
            String chatid = snaps.data.toString();
            //print(chatid);
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                  height: heightscreen * 0.4,
                  color: theprimarycolor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        "Abreham G",
                        style: header18.copyWith(color: Colors.white),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: msgcontents(chatid)),
                    //input and send feilds
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.fromLTRB(
                              20, heightscreen * 0.04, 20, heightscreen * 0.04),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      label: Text(
                                        "Enter something here",
                                        style: header12light,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 235, 240, 255),
                                              width: 1.6),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40))),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          18,
                                          heightscreen * 0.02,
                                          8,
                                          heightscreen * 0.02),
                                    ),
                                    onChanged: (val) => setState(() {
                                          message = val;
                                        })),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    DateTime currentPhoneDate = DateTime.now();
                                    Timestamp myTimeStamp =
                                        Timestamp.fromDate(currentPhoneDate);
                                    if (message != null) {
                                      print(myTimeStamp);
                                      messageservice().uploadMessage(
                                          chatid, message, myTimeStamp);
                                      print("did it send");
                                    } else {
                                      print("NO MESSAGE INSIDE FEILD");
                                    }
                                  },
                                  child: Icon(
                                    Icons.send,
                                    size: 28,
                                    color: theprimarycolor,
                                  )),
                            ],
                          )),
                    ),
                  ],
                )
              ],
            );
          }
          return Text("no convo");
        },
      ),
    ));
  }
}

class msgcontents extends StatelessWidget {
  String chatid;
  msgcontents(this.chatid);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    print(heightscreen);
    var value;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Conversations/$chatid/messages")
            .orderBy("createdon")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snaps) {
          if (snaps.hasData) {
            //listview msg content
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22),
                  ),
                  color: lightgrey),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: heightscreen * 0.8,
              child: ListView(
                shrinkWrap: true,
                children: snaps.data!.docs.map((DocumentSnapshot document) {
                  //individual message object
                  value = document.data();
                  bool isme = value["uid"] == myuid;

                  return textindividual(value["message"], isme);
                }).toList(),
              ),
            );
          }
          return Container();
        });
  }
}

class textindividual extends StatelessWidget {
  String message;
  bool isme;
  textindividual(this.message, this.isme);

  @override
  Widget build(BuildContext context) {
    Color mycolor = Color.fromARGB(255, 255, 194, 175);
    if (!isme) {
      mycolor = Color.fromARGB(255, 175, 185, 255);
      return Row(
        mainAxisAlignment:
            isme ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/aa.jpg"),
          ),
          SizedBox(
            width: 10,
          ),
          chatbubblecustom(isme, message),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment:
            isme ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          chatbubblecustom(isme, message),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/aa.jpg"),
          ),
        ],
      );
    }
  }
}

class chatbubblecustom extends StatelessWidget {
  String message;
  bool issender;

  chatbubblecustom(this.issender, this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color:
              issender ? Color.fromARGB(255, 255, 158, 158) : Colors.grey[200],
          borderRadius: issender
              ? BorderRadius.only(
                  topRight: Radius.circular(17),
                  topLeft: Radius.circular(17),
                  bottomLeft: Radius.circular(17))
              : BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                  bottomLeft: Radius.elliptical(-20, -3))),
      child: Text(
        message,
        style: header10.copyWith(color: Colors.black),
      ),
    );
  }
}

/* 
      Firestore.instance.collection("Conversations/aIiwIH7nhbGJLWnQVBGk/messages").snapshots()
      stream: messageservice().getmessages("aIiwIH7nhbGJLWnQVBGk"),
      builder: (context, snaps) {
        final message = snaps.data;
        if (message != null) {
          return ListView.builder(
            reverse: true,
            itemCount: message.length,
            itemBuilder: (context, index) {
              final msg = message[index];
              print(msg.message);
              return Text(msg.message);
            },
          );
        } else {
          print("Got back nada");
        }
        return Container();
      },

      StreamBuilder<List<dynamic>>(
                  stream: messageservice().getstreamconvos(myuid),
                  builder: (context, snaps) {
                    if (snaps.hasData) {
                      List value = snaps.data!;
                      print(value[0]);
                      print("object");
                    }
                    return Container();
                  },
                ),
      */
