import 'package:flutter/material.dart';
import 'shared/classes.dart';
import 'Screens/home.dart';

class reviewpage extends StatelessWidget {
  const reviewpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    //title
                    backandtitlebtn("Reviews"),
                    SizedBox(
                      height: 18,
                    ),
                    //chips
                    Row(
                      children: [
                        filterChip("All Reviews"),
                        SizedBox(
                          width: 10,
                        ),
                        filterChip("4")
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    reviewblock(
                        "Abel Alem",
                        "assets/aa.jpg",
                        "somethign about sth is the name for the whole stick things now how will it go we shall see if it is thers sticksdfdas abel is my name and this is more blabla and are those tihngs libraries",
                        "assets/four.jpg"),
                    SizedBox(
                      height: 10,
                    ),
                    reviewblock(
                        "Absra asegedom",
                        "assets/addis.jpg",
                        " we shall see if it is thers sticksdfdas abel is my nam and are those tihngs libraries",
                        "assets/four.jpg")
                  ],
                )
              ],
            ),
            //bottom btn
            Align(
                alignment: Alignment.bottomCenter,
                child: buttonWide(60, "Write Review", myhomepagefirst()))
          ],
        ),
      )),
    );
  }
}
