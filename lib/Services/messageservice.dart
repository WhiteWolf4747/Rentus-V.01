import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter06/Models/messageModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

//create a list... theres a users object... add a users list to that doc...so we can filter the docid from one userid using arraycontains filter
String myuid = FirebaseAuth.instance.currentUser!.uid;

CollectionReference conversations =
    FirebaseFirestore.instance.collection("Conversations");

class messageservice {
//get conversation(its id) of x and y ... in it theres a message collection full of there messages
  Future<String?> getcreateconversationid(
      String msgfromid, String msgtoid) async {
    List theusers = [msgfromid, msgtoid];
    dynamic chatid;
    await conversations
        .where("users", isEqualTo: {msgfromid: null, msgtoid: null})
        .limit(1)
        .get()
        .then((value) {
          if (value.docs.isNotEmpty) {
            chatid = value.docs.single.id;
          }
          //adds conversation if there isnt one
          else {
            print("no convo so creating");
            conversations.add({
              //adds conversation with user object identifier
              "users": {msgfromid: null, msgtoid: null},
              "userslist": theusers
            }).then((value) {
              //adds user list
              chatid = value.id;
            });
          }
        })
        .catchError((onError) {});

    return chatid;
  }

  //get a stream of convos(chatid) that happened with my msg id in it
  Stream<List<dynamic>> getstreamconvos(String msgid) {
    return conversations
        .where("userslist", arrayContains: msgid)
        .snapshots()
        .map((event) => event.docs.map((e) {
              return e.id;
            }).toList());
  }

  //get list of user ids that isnt mine from the chat/convos id
  Future<List<dynamic>?> getuseridfromchatidlist(chatidlist) async {
    List chatids = [];

    if (chatidlist != null) {
      for (dynamic each in chatidlist) {
        chatids.add(await FirebaseFirestore.instance
            .collection("Conversations")
            .doc(each)
            .get()
            .then((value) {
          List users;

          if (value.data()!.isNotEmpty) {
            users = value.data()!["userslist"];

            for (String every in users) {
              //my id has to be replaced here
              if (every != myuid) {
                return every;
              }
            }
          } else {
            print("asdfgrgt");
            return "nadaaa";
          }
        }).catchError((error) {
          print(error);
        }));
      }
    } else {
      print("OBJECTION... HEARSAY");
    }
    return chatids;
  }

//upload message... get chat uid from above
  Future uploadMessage(
      String chatuid, String message, Timestamp createdon) async {
    final refrencer = FirebaseFirestore.instance
        .collection("Conversations/$chatuid/messages");
    final msg =
        messageclass(message: message, uid: myuid, createdon: createdon);
    await refrencer.add(msg.tojson());
  }
}


/*
//get the other user ids(list) from chat its(list)
  Future<dynamic> getuseridfromchatid(chatid) async {
    String? uid = await FirebaseFirestore.instance
        .collection("Conversations")
        .doc(chatid)
        .get()
        .then((value) {
      List users;

      if (value.data()!.isNotEmpty) {
        users = value.data()!["userlist"];

        for (String every in users) {
          if (every != "user01uid") {
            return every;
          }
        }
      } else {
        print("asdfgrgt");
        return null;
      }
    }).catchError((error) {
      print(error);
    });
    return uid;
  }

  
//NOT NEEDED
//get messages from chat uid... which can be done from above
  Stream<List<messageclass>> getmessages(String chatuid) {
    final listrefrencer = FirebaseFirestore.instance
        .collection("Conversations/$chatuid/messages");
    print(listrefrencer.snapshots().map(messagelistfromsnaps));
    print("object");

    return listrefrencer.snapshots().map(messagelistfromsnaps);
  }

//NOT NEEDED
//converts input to readable objects list
  List<messageclass> messagelistfromsnaps(QuerySnapshot snaps) {
    print(snaps.docs.single.id.toString() + "wtgdddddddddddddd");
    return snaps.docs.map((each) {
      return messageclass(
        message: each.get("message") ?? "",
        uid: each.get("uid") ?? "",
      );
    }).toList();
  }
}

//NOT NEEDED
//get messages from chat uid... which can be done from above
  Stream<List<messageclass>> getmessages(String chatuid) {
    final listrefrencer = FirebaseFirestore.instance
        .collection("Conversations/$chatuid/messages");
    print(listrefrencer.snapshots().map(messagelistfromsnaps));
    print("object");

    return listrefrencer.snapshots().map(messagelistfromsnaps);
  }

//NOT NEEDED
//converts input to readable objects list
  List<messageclass> messagelistfromsnaps(QuerySnapshot snaps) {
    print(snaps.docs.single.id.toString() + "wtgdddddddddddddd");
    return snaps.docs.map((each) {
      return messageclass(
        message: each.get("message") ?? "",
        uid: each.get("uid") ?? "",
      );
    }).toList();
  }

  //convert this to stream later
  //get list of texts from chat id
  Future<List<dynamic>> getconvoshasmyid(String msgfromid) async {
    List chatid = [];
    await conversations
        .where("userlist", arrayContains: msgfromid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        chatid.add(element.id);
      });
    }).catchError((onError) {
      print(onError.toString());
      print("above is error");
    });

    return chatid;
  }

 */