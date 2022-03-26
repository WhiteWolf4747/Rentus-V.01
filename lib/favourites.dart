import 'package:flutter/material.dart';

class favouritesPage extends StatelessWidget {
  const favouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "poppins"),
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 80, 20, 20),
          child: Column(
            children: [
              //title
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                      width: 1.0, color: Color.fromARGB(255, 211, 211, 211)),
                )),
                child: Row(
                  children: [
                    Text(
                      " Favourites",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              //one block
              favOneBlock("assets/house01.jpg", "Addis Ababa, Ethiopia",
                  "assets/four.jpg", "Stylish 2 bedroom\napartment"),
              SizedBox(
                height: 24,
              ),
              favOneBlock("assets/house02.jpg", "Addis Ababa, Ethiopia",
                  "assets/four.jpg", "Luxury 2 bedroom\nVilla")
            ],
          ),
        ),
      ),
    );
  }
}

class favOneBlock extends StatelessWidget {
  final String favImage;
  final String favTitle;
  final String favRating;
  final String favLocation;

  favOneBlock(this.favImage, this.favLocation, this.favRating, this.favTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border:
              Border.all(width: 1.0, color: Color.fromARGB(255, 221, 221, 221)),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.all(14),
      child: Wrap(
        spacing: 20,
        children: [
          Image(
            image: AssetImage(favImage),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Column(
            //the 3 descriptions
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                favTitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, height: 1.4),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: Image(
                  image: AssetImage(favRating),
                  width: 80,
                ),
              ),
              Text(
                favLocation,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Icon(Icons.delete_rounded)
        ],
      ),
    );
  }
}
