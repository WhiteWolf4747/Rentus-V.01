import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class howitworks extends StatefulWidget {
  const howitworks({Key? key}) : super(key: key);

  @override
  State<howitworks> createState() => _howitworksState();
}

class _howitworksState extends State<howitworks> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: 24,
            color: theprimarycolor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
        child: Expanded(
          child: PageView(
            controller: controller,
            children: [
              howitworksonepage(
                  "assets/hiw01n.png",
                  "Get signed up first and then open an account to see how it works and then do it",
                  "Get signed up first "),
              howitworksonepage(
                  "assets/hiw02.png",
                  "Get signed up first and then open an account to see how it works and then do it",
                  "Get signed up first "),
              howitworksonepage(
                  "assets/hiw03.png",
                  "Get signed up first and then open an account to see how it works and then do it",
                  "Get signed up first "),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 140,
        child: Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(activeDotColor: Colors.deepOrange),
          ),
        ),
      ),
    );
  }
}

class howitworksonepage extends StatelessWidget {
  String imageloc;
  String title;
  String subtitle;

  howitworksonepage(this.imageloc, this.subtitle, this.title);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(30),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widthscreen * 0.6,
              height: heightscreen * 0.3,
              child: Image.asset(
                imageloc,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              title,
              style: header18.copyWith(fontSize: 30),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              subtitle,
              style: header12medium.copyWith(color: textcolorprimary),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
