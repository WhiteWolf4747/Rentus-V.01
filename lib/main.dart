import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter06/Screens/hostapp/createlisting/createlisting.dart';
import 'package:flutter06/Screens/login.dart';
import 'Screens/hostapp/hostbottomnavigation.dart';
import 'package:flutter06/Screens/hostapp/hostprofile.dart';
import 'package:flutter06/bottomnavigator.dart';
import 'package:flutter06/reservations.dart';
import 'package:flutter06/Screens/splashScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //the page
  runApp(splashhomepage());
}
