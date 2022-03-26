import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "poppins"),
      home: Scaffold(
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
                        bottom: BorderSide(width: 1.0, color: Colors.grey))),
                child: Row(
                  children: [
                    //profile pic
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/Joker.jpg"),
                      radius: 40,
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                        //email
                        Text(
                          "abelalem@gmail.com",
                          style: TextStyle(
                              color: Color.fromARGB(255, 133, 133, 133),
                              fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //account settings
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account settings",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 136, 136, 136),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //each section
                  profileEachSection("Personal Information"),
                  profileEachSection("Be Host"),
                  profileEachSection("Notifications"),
                  profileEachSection("How It works"),
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
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "montserrat"),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
          )
        ],
      ),
    );
  }
}
