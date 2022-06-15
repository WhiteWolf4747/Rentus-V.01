import 'package:cloud_firestore/cloud_firestore.dart';

class messageclass {
  final String message;
  final String uid;
  final Timestamp createdon;

  messageclass(
      {required this.message, required this.uid, required this.createdon});

  Map<String, dynamic> tojson() =>
      {"message": message, "uid": uid, "createdon": createdon};
}
