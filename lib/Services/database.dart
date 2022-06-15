import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebasestorager;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter06/Models/houseListing.dart';

class databaseService {
  final String uid;

  databaseService(this.uid);

  houseSpec placeholder = houseSpec(2, 2, 3);

  //refrence
  CollectionReference houserefrencer =
      FirebaseFirestore.instance.collection("House_Listing");

  //update or create
  Future updateAkerayhouselistingData(
    String uid,
    String title,
    String subtitile,
    int rating,
    String description,
    List amenities,
    String location,
    List houserules,
    int price,
    String imageurl,
  ) async {
    return await houserefrencer.doc().set({
      "uid": uid,
      "Title": title,
      "Subtitle": subtitile,
      "Rating": rating,
      "Description": description,
      "Amenities": amenities,
      "Location": location,
      "House Rules": houserules,
      "Price": price,
      "ImageURL": imageurl
    });
  }

  //get houselisting objects list from snapshots... from folder
  List<HouseListing> houselistfromsnapshot(QuerySnapshot snaps) {
    return snaps.docs.map((each) {
      return HouseListing(
        uid: each.get("uid") ?? "",
        title: each.get("Title") ?? "",
        amenities: each.get("Amenities") ?? "",
        description: each.get("Description") ?? "",
        houserules: each.get("House Rules") ?? "",
        housespecifications: each.get("House Specs") ?? "",
        location: each.get("Location") ?? "",
        price: each.get("Price") ?? "",
        rating: each.get("Rating") ?? "",
        subtitle: each.get("Subtitle") ?? "",
        imageurl: each.get("ImageURL") ?? "",
        bedrooms: each.get("Bedrooms") ?? "",
        houseuid: each.get("HouseUID") ?? "",
      );
    }).toList();
  }

  //stream for houselisting class
  Stream<List<HouseListing>?>? get houseStream {
    try {
      return houserefrencer.snapshots().map(houselistfromsnapshot);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //get single object from collection
  Future<HouseListing?> getsinglehouselisting(String houseuid) async {
    final docobj =
        FirebaseFirestore.instance.collection("House_Listing").doc(houseuid);
    final docobjsnap = await docobj.get();

    if (docobjsnap.exists) {
      return HouseListing.fromjson(docobjsnap.data()!);
    } else {
      print("asfasf");
    }
  }

  Future createuserindatabase(
      String username, String imageurl, String email) async {
    return await FirebaseFirestore.instance.collection("user").doc().set({
      "uid": uid,
      "username": username,
      "imageurl": imageurl,
      "email": email
    });
  }

  //get imageurl from user
  Future<Map<String, dynamic>?> getuserinfo(String useruid) async {
    final userdoc = FirebaseFirestore.instance.collection("user").doc(useruid);
    final userget = await userdoc.get();

    if (userget.exists) {
      return userget.data();
    } else {
      print("objectss");
    }
  }

  //create user favourites
  Future adduserfavourites(String houselistingid, String myuid) async {
    return await FirebaseFirestore.instance
        .collection("user/$myuid/favourites")
        .doc()
        .set({"houseuid": houselistingid});
  }
}

//

//still have no use for this
class storageService {
  final firebasestorager.FirebaseStorage storageapi =
      firebasestorager.FirebaseStorage.instance;

  //upload file
  Future uploadFile(String filepath, String filename) async {
    File file = File(filepath);

    try {
      await storageapi.ref("imagestest/$filename").putFile(file);
    } catch (e) {
      print(e);
    }
  }

  //get imageurl... maybe add an extra parameter for uid
  Future getImageURL(String name) async {
    String downloadurl =
        await storageapi.ref("imagestest/$name").getDownloadURL();

    return downloadurl;
  }

  //get imagelist... the names of the files inside the folder

  Future imagelisturlsfromuid(String uid) async {
    firebasestorager.ListResult listres = await storageapi.ref(uid).listAll();

    List x = [];
    for (var each in listres.items) {
      String value = await storageapi.ref(each.fullPath).getDownloadURL();
      x.add(value);
    }

    return x;
  }
}
