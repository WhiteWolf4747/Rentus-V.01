import 'package:flutter/material.dart';
import 'package:flutter06/main.dart';
import 'classes.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "poppins",
          scaffoldBackgroundColor: Color.fromARGB(255, 233, 233, 233)),
      home: Scaffold(
          body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 80, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Container(
                  width: 90,
                  child: Image(image: AssetImage("assets/logo.png")),
                ),
                SizedBox(
                  height: 10,
                ),
                //title
                Text(
                  "Welcome to Rentus",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                //subtitle
                Text(
                  "You can be anywhere anytime anywhere",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 28,
                ),
                //email input
                textfieldinput(Icons.email, "Enter something here"),
                SizedBox(
                  height: 10,
                ),
                textfieldinput(Icons.password, "Enter password"),
                SizedBox(
                  height: 10,
                ),
                //the login button
                buttonWide(55, "Login", statefullhome()),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "or",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                //googel buttons
                btnWideIcon(Icons.facebook, "Sign In with Google"),
                SizedBox(
                  height: 20,
                ),
                btnWideIcon(Icons.facebook, "Sign In with Facebook"),
                SizedBox(
                  height: 28,
                ),
                //forgot passowrd
                Text(
                  "Forgot password?",
                  style: TextStyle(
                      color: primarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "dont have an account but you can?",
                      style:
                          TextStyle(color: Color.fromARGB(255, 119, 119, 119))),
                  TextSpan(
                      text: " Register here",
                      style: TextStyle(
                          color: primarycolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ])),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
