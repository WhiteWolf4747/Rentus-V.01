import 'package:flutter/material.dart';
import 'package:flutter06/Screens/howitworks.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';

import '../Services/auth.dart';

class profilepersonalpage extends StatelessWidget {
  const profilepersonalpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              backandtitlebtn("Profile"),

              //top displayer
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(width: 1, color: linecolor))),
                child: Row(
                  children: [
                    //profile pic
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/Joker.jpg"),
                      radius: 36,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    //Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abel Alem",
                          style: header14,
                        ),

                        //email
                        Text(
                          "abelalem@gmail.com",
                          style: header12light,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 28,
              ),
              //account settings
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //each section
                  personalprofileEachSection("Email", Icons.email_outlined),
                  personalprofileEachSection(
                      "Phone number", Icons.phone_android_outlined),
                  personalprofileEachSection(
                      "Change Password", Icons.password_outlined),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class personalprofileEachSection extends StatelessWidget {
  final String profileTitle;
  IconData icon;
  personalprofileEachSection(this.profileTitle, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: linecolor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 22,
                color: theprimarycolor,
              ),
              SizedBox(width: 16),
              Text(
                profileTitle,
                style: header12bold.copyWith(fontSize: 15),
              ),
            ],
          ),
          Text(
            "email@gmail.com",
            style: header10,
          ),
        ],
      ),
    );
  }
}
