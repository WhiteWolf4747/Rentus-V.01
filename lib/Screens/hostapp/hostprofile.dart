import 'package:flutter/material.dart';
import 'package:flutter06/Screens/howitworks.dart';
import 'package:flutter06/Screens/profilepersonal.dart';
import 'package:flutter06/Services/auth.dart';
import 'package:flutter06/bottomnavigator.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';

class hostprofilePage extends StatelessWidget {
  const hostprofilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
              decoration: buttonshadow,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: ElevatedButton(
                  onPressed: () => AuthService().signOut(),
                  child: Text(
                    "Logout",
                    style: header14.copyWith(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.fromHeight(60)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                    backgroundColor: MaterialStateProperty.all(theprimarycolor),
                  ))),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //top displayer
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1.4, color: textcolorsecondary))),
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
                  Text(
                    "Account settings",
                    style: header14.copyWith(
                        color: textcolorsecondary,
                        fontFamily: "montserrat",
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //each section
                  InkWell(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => profilepersonalpage())),
                      child: profileEachSection("Personal Information")),
                  InkWell(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => howitworks())),
                      child: profileEachSection("How It works")),
                  InkWell(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => bottomnavigationbar())),
                      child: profileEachSection("Switch to Normal User")),
                  profileEachSection("Terms of service"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class profileEachSection extends StatelessWidget {
  final String profileTitle;
  profileEachSection(this.profileTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 202, 202, 202)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            profileTitle,
            style: header12bold.copyWith(fontSize: 15),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 22,
            color: textcolorsecondary,
          )
        ],
      ),
    );
  }
}
