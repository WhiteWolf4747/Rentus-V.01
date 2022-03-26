import 'package:flutter/material.dart';
import 'listingdetailpage.dart';

Color textcolor = Color.fromARGB(255, 30, 28, 51);
Color primarycolor = Colors.deepOrange;
Color greycolor = Color.fromARGB(255, 114, 114, 114);
String textfont = "montserrat";
TextTheme typography = TextTheme(headline1: TextStyle(fontSize: 32));

class house {
  String title = "Entire 2bedroom is aprtment complex";
  String subtitle = "Stylish modern 2bedrrom in city center";
  double rating = 4.0;
  String description =
      "Stylish modern 2bedrrom in city center.Stylish modern 2bedrrom in city centerStylish modern 2bedrrom in city center";
  int price = 29;
  String image = "assets/house03.jpg";
}

house house01 = new house();

class locationEachBlocks extends StatelessWidget {
  final String imageloc;
  final String locTitle;

  locationEachBlocks(this.imageloc, this.locTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          image:
              DecorationImage(image: AssetImage(imageloc), fit: BoxFit.cover)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 0, 0, 0.15),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          Text(
            locTitle,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class locationscrollview extends StatelessWidget {
  const locationscrollview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          locationEachBlocks("assets/aa.jpg", " Addis\nAbaba"),
          SizedBox(
            width: 20,
          ),
          locationEachBlocks("assets/axum.jpg", "Axum"),
          SizedBox(
            width: 20,
          ),
          locationEachBlocks("assets/lalibela.jpg", "Lalibela"),
          SizedBox(
            width: 20,
          ),
          locationEachBlocks("assets/lalibela.jpg", "Lalibela")
        ],
      ),
    );
  }
}

class featuredEachBlocks extends StatelessWidget {
  final String featuredImage;
  final String featuredRating;
  final String featuredTitle;
  final String featuredprice;

  featuredEachBlocks(this.featuredImage, this.featuredRating,
      this.featuredTitle, this.featuredprice);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => listingdetail())),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: 175,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(featuredImage), fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              Positioned(
                  bottom: -15,
                  right: 10,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("assets/Joker.jpg"),
                  ))
            ],
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 4),
              width: 75,
              child: Image(image: AssetImage(featuredRating))),
          Container(
            width: 175,
            height: 35,
            child: Text(
              featuredTitle,
              style: TextStyle(
                  height: 1.2,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              featuredprice,
              style: TextStyle(
                  height: 1.1,
                  fontSize: 16,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class catagoriesFilterChip extends StatefulWidget {
  final String filterChipTitle;

  catagoriesFilterChip(this.filterChipTitle);

  @override
  State<catagoriesFilterChip> createState() => _catagoriesFilterChipState();
}

class _catagoriesFilterChipState extends State<catagoriesFilterChip> {
  Color backColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.filterChipTitle,
        style: TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      backgroundColor: backColor,
      onSelected: (_isSelected) {
        setState(() {
          _isSelected = false;
          backColor = primarycolor;
        });
      },
    );
  }
}

class CustomCategoryChip extends StatelessWidget {
  final String title;

  CustomCategoryChip(this.title);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        title,
        style: TextStyle(fontFamily: "poppins"),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class CustomAmenitiesChip extends StatelessWidget {
  final String name;
  final IconData amenitiesicon;

  CustomAmenitiesChip(this.name, this.amenitiesicon);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        children: [
          Icon(
            amenitiesicon,
            size: 16,
          ),
          Text(
            name,
            style:
                TextStyle(fontFamily: "poppins", fontWeight: FontWeight.w600),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 51, 255, 0),
    );
  }
}

class houseRules extends StatelessWidget {
  final IconData houseRulesIcon;
  final String ruleTitle;
  final String ruleSubtitle;

  houseRules(this.houseRulesIcon, this.ruleTitle, this.ruleSubtitle);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          houseRulesIcon,
          size: 44,
          color: primarycolor,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ruleTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              ruleSubtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            )
          ],
        )
      ],
    );
  }
}

class textfieldinput extends StatelessWidget {
  final IconData textfieldicon;
  final String textfieldtitle;

  textfieldinput(this.textfieldicon, this.textfieldtitle);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 212, 212, 212), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      prefixIcon: Icon(
        textfieldicon,
        size: 24,
      ),
      label: Text(
        textfieldtitle,
        style: TextStyle(color: Color.fromARGB(255, 83, 83, 83), fontSize: 14),
      ),
      contentPadding: EdgeInsets.fromLTRB(10, 13, 0, 13),
    ));
  }
}

class buttonWide extends StatelessWidget {
  final String btntitile;
  final double btnheight;
  final Widget btndestinationwidget;

  buttonWide(this.btnheight, this.btntitile, this.btndestinationwidget);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => btndestinationwidget));
        },
        child: Text(
          btntitile,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.fromHeight(btnheight)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
          backgroundColor: MaterialStateProperty.all(primarycolor),
        ));
  }
}

class btnWideIcon extends StatelessWidget {
  final IconData btnicon;
  final String btntitle;

  btnWideIcon(this.btnicon, this.btntitle);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          print("object");
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.fromHeight(55)),
        ),
        icon: Icon(
          btnicon,
          size: 28,
        ),
        label: Text(
          btntitle,
          style: TextStyle(fontSize: 18),
        ));
  }
}

class sliderprice extends StatefulWidget {
  const sliderprice({Key? key}) : super(key: key);

  @override
  State<sliderprice> createState() => _sliderpriceState();
}

class _sliderpriceState extends State<sliderprice> {
  var selectedRange = RangeValues(0.2, 0.8);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: selectedRange,
      activeColor: primarycolor,
      onChanged: (RangeValues newRange) {
        setState(() => selectedRange = newRange);
      },
    );
  }
}

class filterChip extends StatefulWidget {
  final String filterChipTitle;
  filterChip(this.filterChipTitle);

  @override
  State<filterChip> createState() => _filterChipState();
}

class _filterChipState extends State<filterChip> {
  var _isSelected = false;

  Color backColor = Color.fromARGB(31, 161, 161, 161);
  Color fontColor = Color.fromARGB(255, 148, 148, 148);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.filterChipTitle,
        style: TextStyle(
            fontSize: 16, color: fontColor, fontWeight: FontWeight.w600),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      backgroundColor: backColor,
      padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
      onSelected: (_isSelected) {
        setState(() {
          _isSelected = false;
          backColor = Color.fromARGB(40, 255, 86, 34);
          fontColor = Color.fromARGB(255, 255, 60, 0);
        });
      },
    );
  }
}

class msgOneProfile extends StatelessWidget {
  const msgOneProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),

        //one message
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/Joker.jpg"),
              radius: 30,
            ),
            SizedBox(
              width: 10,
            ),
            //message content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Text(
                  "Abreham atlaw",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                //content
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text(
                    "Hellow world my name is bale is the way\nis the wat of the world",
                    style: TextStyle(
                        color: Color.fromARGB(255, 158, 158, 158),
                        height: 1.8,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "January 12 2022 8:03 PM",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class smallerfeaturedblock extends StatelessWidget {
  const smallerfeaturedblock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/house02.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            child: Text(
              "Entire 2 bedroom apartment with shower",
              maxLines: 2,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          //location
          Text(
            "Bole, Addis Ababa",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          )
        ],
      ),
    );
  }
}
