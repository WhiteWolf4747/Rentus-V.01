import 'package:flutter/material.dart';
import 'package:flutter06/Screens/login.dart';
import 'package:flutter06/Screens/splashScreen.dart';
import 'package:flutter06/Services/auth.dart';
import 'package:flutter06/main.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Services/registerOrSignin.dart';
import 'bottomnavigator.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => googlesigninprovider(),
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Something went wrong"),
              );
            } else if (snapshot.hasData) {
              return bottomnavigationbar();
            } else {
              return loginScaffold();
            }
          })),
    );
  }
}


/**
 * 
 * final usrstream = Provider.of<User?>(context);

    //either returns login or home page
    if (usrstream == null) {
      return loginScaffold();
    } else {
      return bottomnavigationbar();
    }
 */