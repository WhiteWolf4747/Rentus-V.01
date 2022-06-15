import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/filter.dart';

//colors
Color theprimarycolor = Color.fromARGB(255, 241, 39, 17);
Color textcolorprimary = Color.fromARGB(255, 34, 50, 99);
Color textcolorsecondary = Color.fromARGB(255, 144, 152, 177);
Color linecolor = Color.fromARGB(255, 235, 240, 255);
Color lightgrey = Color.fromARGB(250, 250, 250, 255);

Decoration orangegradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 245, 175, 21),
      Color.fromARGB(255, 241, 39, 17)
    ],
    tileMode: TileMode.repeated,
  ),
);

//shadow
Decoration buttonshadow = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(64, 191, 255, 0.24),
      spreadRadius: 0,
      blurRadius: 30,
      offset: Offset(0, 10), // changes position of shadow
    ),
  ],
);
Decoration normalshadow = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(157, 157, 157, 0.14),
      spreadRadius: 0,
      blurRadius: 5,
      offset: Offset(0, 4), // changes position of shadow
    ),
  ],
);

Decoration linedboxdec = BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: linecolor,
      width: 1.5,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)));

Decoration orangeoutlineboc = BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: theprimarycolor,
      width: 1.4,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)));

//fonts
TextStyle header20 = TextStyle(
    fontFamily: "poppins",
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: textcolorprimary);
TextStyle header18bold = TextStyle(
    fontFamily: "poppins",
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: textcolorprimary);
TextStyle header18 = TextStyle(
    fontFamily: "poppins",
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textcolorprimary);
TextStyle header16 = TextStyle(
    fontFamily: "poppins",
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textcolorprimary);
TextStyle header14 = TextStyle(
    fontFamily: "poppins",
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: textcolorprimary);
TextStyle header14light =
    TextStyle(fontFamily: "poppins", fontSize: 17, color: textcolorsecondary);
TextStyle header12light =
    TextStyle(fontFamily: "poppins", fontSize: 14, color: textcolorsecondary);
TextStyle header12medium = TextStyle(
    fontFamily: "poppins",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textcolorsecondary);
TextStyle header12bold = TextStyle(
    fontFamily: "poppins",
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: textcolorprimary);
TextStyle header10 =
    TextStyle(fontFamily: "poppins", fontSize: 12, color: textcolorsecondary);
TextStyle header8 =
    TextStyle(fontFamily: "poppins", fontSize: 10, color: textcolorsecondary);

class custmappbar extends StatelessWidget {
  const custmappbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 75,
          decoration: orangegradient,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notification_important_outlined,
                color: Colors.white,
                size: 24,
              ),
              RichText(
                  text: TextSpan(
                      text: "Rent",
                      style: header18bold.copyWith(fontFamily: "montserrat"),
                      children: [
                    TextSpan(
                        text: "US",
                        style: header18bold.copyWith(
                            fontFamily: "montserrat", color: Colors.white))
                  ])),
              InkWell(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => filterSheet())),
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 24,
                  )),
            ],
          ),
        ));
  }
}

class customsearchbar extends StatelessWidget {
  const customsearchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return Container(
      width: widthscreen * 0.8,
      height: 48,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 252, 252),
        borderRadius: BorderRadius.all(Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(157, 157, 157, 0.14),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
            child: Icon(
              Icons.search,
              color: textcolorsecondary,
              size: 28,
            ),
          ),
          Text("Enter something here...",
              style: header12light.copyWith(color: textcolorsecondary))
        ],
      ),
    );
  }
}
