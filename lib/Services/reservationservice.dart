import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebasestorager;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:flutter06/Models/reservationmodel.dart';
import 'package:uuid/uuid.dart';

class reservationservice {
  String useruid;
  String hostuid;

  reservationservice(this.useruid, this.hostuid);

  Future createreservation(reservationmodel reservationmodel) async {
    var uid = Uuid();
    var reservationuid = uid.v4();
    //create pending on current user
    await FirebaseFirestore.instance
        .collection("user/$useruid/userreservationpending")
        .doc(reservationuid)
        .set({
      "datefrom": reservationmodel.datefrom,
      "dateto": reservationmodel.dateto,
      "guests": reservationmodel.guests,
      "hostuid": reservationmodel.hostuid,
      "housetitle": reservationmodel.housetitle,
      "houseuid": reservationmodel.houseuid,
      "reserveruid": reservationmodel.reserveruid,
      "totalfee": reservationmodel.totalfee,
      "reservationuid": reservationuid
    });
    // create pending on host account
    await FirebaseFirestore.instance
        .collection("user/$hostuid/hostreservationpending")
        .doc(reservationuid)
        .set({
      "datefrom": reservationmodel.datefrom,
      "dateto": reservationmodel.dateto,
      "guests": reservationmodel.guests,
      "hostuid": reservationmodel.hostuid,
      "housetitle": reservationmodel.housetitle,
      "houseuid": reservationmodel.houseuid,
      "reserveruid": reservationmodel.reserveruid,
      "totalfee": reservationmodel.totalfee,
      "reservationuid": reservationuid
    });
  }
}
