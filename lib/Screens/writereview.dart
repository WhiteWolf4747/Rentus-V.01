import 'package:flutter/material.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';

class writereview extends StatelessWidget {
  const writereview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: writereviewscaf(),
    );
  }
}

class writereviewscaf extends StatelessWidget {
  const writereviewscaf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 70, 20, 20),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backandtitlebtn("Write a review"),
              SizedBox(
                height: 18,
              ),
              Text(
                "Please enter a review about your stay and your experience",
                style: header14,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Image(
                      image: AssetImage("assets/5star01.png"),
                      height: heightscreen * 0.06),
                  Text(
                    "4/5",
                    style: header12medium,
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Write review",
                style: header14,
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: double.infinity,
                height: heightscreen * 0.24,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: theprimarycolor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                padding: EdgeInsets.fromLTRB(14, 6, 14, 14),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text(
                      "Write something here and dont sya sth bad or karma will bite ur a",
                      style: header12medium.copyWith(height: 1.6),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
