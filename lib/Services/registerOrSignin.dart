import 'package:flutter/material.dart';
import 'package:flutter06/Screens/login.dart';
import 'package:flutter06/main.dart';
import 'package:flutter06/bottomnavigator.dart';

class signorregister extends StatefulWidget {
  const signorregister({Key? key}) : super(key: key);

  @override
  State<signorregister> createState() => _signorregisterState();
}

class _signorregisterState extends State<signorregister> {
  bool showsignin = true;
  toggleview() {
    setState(() {
      showsignin = !showsignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return loginScaffold(toggleview: toggleview);
    } else {
      return bottomnavigationbar();
    }
  }
}
