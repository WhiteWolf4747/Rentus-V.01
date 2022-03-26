import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'classes.dart';

//double x = MediaQuery.of(context).size.width;

class msgNotpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "montserrat"),
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.all(20),
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                bottom: TabBar(
                    indicatorColor: primarycolor,
                    indicatorWeight: 4,
                    labelStyle: TextStyle(
                        fontFamily: "montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    labelPadding: EdgeInsets.zero,
                    unselectedLabelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "montserrat"),
                    unselectedLabelColor: Color.fromARGB(255, 97, 97, 97),
                    tabs: [
                      Tab(
                        child: Text(
                          "Messages",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Notification",
                          style: TextStyle(fontFamily: "montserrat"),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Feed",
                          style: TextStyle(fontFamily: "montserrat"),
                        ),
                      )
                    ]),
              ),
              body: TabBarView(children: [
                msgprofiles(),
                Icon(Icons.filter_alt_rounded),
                Icon(Icons.home),
              ]),
            )),
      )),
    );
  }
}

class msgprofiles extends StatelessWidget {
  const msgprofiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            msgOneProfile(),
            SizedBox(
              height: 12,
            ),
            msgOneProfile(),
            SizedBox(
              height: 18,
            ),
            msgOneProfile(),
            SizedBox(
              height: 18,
            ),
          ],
        )
      ],
    );
  }
}
