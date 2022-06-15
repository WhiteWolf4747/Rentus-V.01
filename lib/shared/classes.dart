import 'package:flutter/material.dart';
import 'package:flutter06/shared/styles.dart';
import '../Screens/listingdetailpage.dart';
import 'package:flutter06/Services/database.dart';

//constants

Color textcolor = Color.fromARGB(255, 30, 28, 51);
Color primarycolor = Colors.deepOrange;
Color greycolor = Color.fromARGB(255, 114, 114, 114);
String textfont = "montserrat";
TextTheme typography = TextTheme(headline1: TextStyle(fontSize: 32));

//decorations

InputDecoration textformfielddec = InputDecoration(
  enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Color.fromARGB(255, 235, 240, 255), width: 1.6),
      borderRadius: BorderRadius.all(Radius.circular(5))),
  contentPadding: EdgeInsets.all(22),
);

Decoration lineargradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color.fromARGB(255, 238, 214, 0), Color.fromARGB(255, 255, 60, 0)],
    tileMode: TileMode.repeated,
  ),
);

ButtonStyle y = ButtonStyle(
  minimumSize: MaterialStateProperty.all(Size.fromHeight(60)),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)))),
);

//temp class
class house {
  String title = "Entire 2bedroom is the re aprtment complex";
  String subtitle = "Stylish modern 2bedrrom in city center";
  double rating = 4.0;
  String description =
      "Stylish modern 2bedrrom in city center.Stylish modern 2bedrrom in city centerStylish modern 2bedrrom in city center";
  int price = 29;
  String image = "assets/house03.jpg";
}

house house01 = new house();

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//widgets

//home page
class locationEachBlocks extends StatelessWidget {
  final String imageloc;
  final String locTitle;

  locationEachBlocks(this.imageloc, this.locTitle);

  @override
  Widget build(BuildContext context) {
    double screenwidth = getScreenWidth(context);
    return Container(
      height: screenwidth * 0.24,
      width: screenwidth * 0.26,
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
    double screenwidth = getScreenWidth(context);
    double screenheight = getScreenHeight(context);
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => listingdetail("uid"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: screenheight * 0.22,
                width: screenwidth * 0.43,
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
              width: 85,
              child: Image(image: AssetImage(featuredRating))),
          Container(
            width: 175,
            height: 35,
            child: Text(
              featuredTitle,
              style: TextStyle(
                  height: 1.3,
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            featuredprice,
            style: TextStyle(
                height: 1.1,
                fontSize: 16,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

//new featured block
class featuredEachBlocksnew extends StatelessWidget {
  final String imageurl;
  final String featuredRating;
  final String featuredTitle;
  final String featuredprice;
  final String houseuid;

  featuredEachBlocksnew(this.imageurl, this.featuredRating, this.featuredTitle,
      this.featuredprice, this.houseuid);

  @override
  Widget build(BuildContext context) {
    double screenwidth = getScreenWidth(context);
    double screenheight = getScreenHeight(context);

    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => listingdetail(houseuid))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenheight * 0.22,
                    width: screenwidth * 0.43,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageurl), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 6, 0, 4),
                      height: 10,
                      child: Image(image: AssetImage(featuredRating))),
                  Text(
                    featuredTitle,
                    style: header12bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "\$$featuredprice",
                          style: header12bold.copyWith(color: theprimarycolor),
                          children: [
                        TextSpan(text: " /night", style: header8)
                      ])),
                ],
              ),
              Positioned(
                  top: 130,
                  right: 6,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(157, 157, 157, 0.14),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite_outline,
                      color: textcolorprimary,
                      size: 20,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

//chips
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
        style: header12medium,
      ),
      backgroundColor: backColor,
      onSelected: (_isSelected) {
        setState(() {
          _isSelected = false;
          backColor = theprimarycolor;
        });
      },
      elevation: 1,
    );
  }
}

class CustomCategoryChip extends StatelessWidget {
  final String title;

  CustomCategoryChip(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: normalshadow,
      child: Chip(
        label: Text(
          title,
          style: header12medium,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 5,
      ),
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
            size: 28,
            color: Colors.white,
          ),
          Text(
            name,
            style: TextStyle(
                fontFamily: "poppins",
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 60, 0),
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

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: true,
      label: Text(
        widget.filterChipTitle,
        style: header12medium.copyWith(color: theprimarycolor),
      ),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      backgroundColor: linecolor,
      padding: EdgeInsets.fromLTRB(10, 17, 10, 17),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Color.fromARGB(43, 255, 60, 0),
    );
  }
}

//text feild input

class textfieldinput extends StatelessWidget {
  final IconData textfieldicon;
  final String textfieldtitle;

  textfieldinput(this.textfieldicon, this.textfieldtitle);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: linecolor, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: linecolor, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      prefixIcon: Icon(
        textfieldicon,
        size: 24,
      ),
      label: Text(
        textfieldtitle,
        style: header12bold.copyWith(color: textcolorsecondary),
      ),
      contentPadding: EdgeInsets.fromLTRB(10, 13, 0, 13),
    ));
  }
}

//buttons

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
          style: header14.copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.fromHeight(btnheight)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
          backgroundColor: MaterialStateProperty.all(theprimarycolor),
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

class backandtitlebtn extends StatelessWidget {
  String title;

  backandtitlebtn(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 28),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.8, color: linecolor))),
      child: Row(
        children: [
          InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: 20,
                color: textcolorsecondary,
              )),
          Text(
            "   $title",
            style: header16,
          )
        ],
      ),
    );
  }
}

//blocks

class favOneBlock extends StatelessWidget {
  final String favImage;
  final String favTitle;
  final String favRating;
  final String favLocation;
  final String houseuid;

  favOneBlock(this.favImage, this.favLocation, this.favRating, this.favTitle,
      this.houseuid);

  @override
  Widget build(BuildContext context) {
    double _screenwidth = getScreenWidth(context);
    double _screenheight = getScreenHeight(context);
    print(_screenwidth);
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => listingdetail(houseuid))),
      child: Container(
        width: double.infinity,
        height: _screenheight * 0.17,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: linecolor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(favImage),
                  width: _screenwidth * 0.2,
                  height: _screenheight * 0.15,
                  fit: BoxFit.cover,
                )),
            SizedBox(width: 20),
            Column(
              //the 3 descriptions
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: _screenwidth * 0.44,
                      child: Text(
                        favTitle,
                        style: header12bold,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    /*
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.4, color: textcolorsecondary))),
                     */
                  ],
                ),
                RichText(
                    text: TextSpan(
                        text: "\$ 125",
                        style: header12medium.copyWith(color: theprimarycolor),
                        children: [TextSpan(text: " /night", style: header8)]))
              ],
            ),
            SizedBox(width: 6),
            Icon(
              Icons.delete_outline_outlined,
              color: textcolorsecondary,
            )
          ],
        ),
      ),
    );
  }
}

class smallerfeaturedblock extends StatelessWidget {
  const smallerfeaturedblock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = getScreenWidth(context);
    return Container(
      width: screenwidth * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          Container(
            height: screenwidth * 0.26,
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
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          //location
        ],
      ),
    );
  }
}

class reviewblock extends StatelessWidget {
  String profileName;
  String reviewcontent;
  String reviewrating;
  String profileimage;

  reviewblock(this.profileName, this.profileimage, this.reviewcontent,
      this.reviewrating);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileimage),
                radius: 28.0,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profileName, style: header14),
                    Image.asset(
                      "assets/5star01.png",
                      height: 18,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
            child: Text(
              reviewcontent,
              style: header12light.copyWith(height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}

//...

class msgOneProfile extends StatelessWidget {
  const msgOneProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
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

class messageoneprofilenew extends StatelessWidget {
  String imageurl;
  String username;

  messageoneprofilenew({required this.imageurl, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageurl),
          radius: 30,
        ),
        SizedBox(
          width: 10,
        ),
        //message content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                username,
                style: header14,
              ),
              //content
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 8),
                child: Text(
                  "Hellow world my name is bale is the way\nis the wat of the world",
                  style: header12medium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              Text(
                "January 12 2022 8:03 PM",
                style: header10.copyWith(color: textcolorprimary),
              )
            ],
          ),
        )
      ],
    );
  }
}

class topappbar extends StatelessWidget {
  const topappbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 238, 214, 0),
                Color.fromARGB(255, 255, 60, 0)
              ],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
                size: 32,
              ),
              Text(
                "Rentus",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
                size: 32,
              )
            ],
          ),
        ));
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
          size: 36,
          color: theprimarycolor,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ruleTitle,
                style: header12medium.copyWith(
                    fontWeight: FontWeight.w600, color: textcolorprimary),
              ),
              Text(
                ruleSubtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: header10,
              )
            ],
          ),
        )
      ],
    );
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
      activeColor: theprimarycolor,
      onChanged: (RangeValues newRange) {
        setState(() => selectedRange = newRange);
      },
    );
  }
}

class circlenumbers extends StatelessWidget {
  String number;
  circlenumbers(this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: textcolorsecondary),
      child: Center(
        child: Text(
          number,
          style: header18bold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class createlistingbtn extends StatelessWidget {
  String text;
  createlistingbtn(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(28, 6, 28, 6),
      decoration: BoxDecoration(
          border: Border.all(color: linecolor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Text(
        text,
        style: header10.copyWith(
            color: theprimarycolor, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class previouspagebtn extends StatelessWidget {
  int pageindex;
  previouspagebtn(this.pageindex);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        DefaultTabController.of(context)!.animateTo(pageindex);
      },
      child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: theprimarycolor, // <-- Button color
        onPrimary: Colors.blue, // <-- Splash color
      ),
    );
  }
}

class nextpagebtn extends StatelessWidget {
  int pageindex;
  nextpagebtn(this.pageindex);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        DefaultTabController.of(context)!.animateTo(pageindex);
      },
      child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: theprimarycolor, // <-- Button color
        onPrimary: Colors.blue, // <-- Splash color
      ),
    );
  }
}

//text font 6rYsZ1a8HtcSPN8OS5eISZaYEI72

/*

Text(
                    favLocation,
                    style: header10,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

//text font
TextStyle header1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));
TextStyle header2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));
TextStyle header3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));
TextStyle header4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));
TextStyle header5 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));
TextStyle header6 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));
TextStyle header7 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));
TextStyle header8 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));
TextStyle header9 = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255));



InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => listingdetail())),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: screenheight * 0.23,
                width: screenwidth * 0.43,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
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
              width: 85,
              child: Image(image: AssetImage(featuredRating))),
          Container(
            width: 175,
            height: 35,
            child: Text(
              featuredTitle,
              style: TextStyle(
                  height: 1.3,
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            featuredprice,
            style: TextStyle(
                height: 1.1,
                fontSize: 16,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    )

 */