import 'package:flutter/material.dart';
import 'package:flutter06/Screens/hostapp/createlisting/photoupload.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';

String title = "";
String description = "";
String addistionalrules = "";
String selectedstreet = "";
var selectedcity = "Addis Ababa";
List selectedhouseruleslist = [];

class housedescpage extends StatefulWidget {
  const housedescpage({Key? key}) : super(key: key);

  @override
  State<housedescpage> createState() => _housedescpageState();
}

class _housedescpageState extends State<housedescpage> {
  var cities = [
    "Addis Ababa",
    "Dire Dawa",
    "Gondar",
    "Hawassa",
    "Adama",
    "Harar",
    "Mekelle",
    "Bahir Dar",
    "Dessie",
    "Axum",
    "Lalibela"
  ];

  @override
  Widget build(BuildContext context) {
    print(selectedhouseruleslist);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "1. Location:",
              style: header16.copyWith(fontWeight: FontWeight.w500),
            ),
            createlistingbtn("Get current location"),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          width: double.infinity,
          decoration: linedboxdec,
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              iconEnabledColor: theprimarycolor,
              value: selectedcity,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: cities.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: header12light,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedcity = newValue!;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 54,
          decoration: linedboxdec,
          padding: EdgeInsets.fromLTRB(16, 4, 6, 4),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                "Entire street Adress",
                style: header12light.copyWith(height: 1.6),
              ),
            ),
            onChanged: (val) {
              selectedstreet = val;
            },
          ),
        ),
        SizedBox(
          height: 26,
        ),
        Text(
          "2. Title:",
          style: header16.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          width: double.infinity,
          height: 54,
          decoration: linedboxdec,
          padding: EdgeInsets.fromLTRB(16, 4, 6, 4),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                "Entire Title",
                style: header12light.copyWith(height: 1.6),
              ),
            ),
            onChanged: (val) {
              selectedstreet = val;
            },
          ),
        ),
        SizedBox(
          height: 26,
        ),
        Text(
          "3. Description:",
          style: header16.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          width: double.infinity,
          height: 200,
          decoration: orangeoutlineboc,
          padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                "Enter a deetailed descriprion about the house and any information that is usefull ",
                style: header10.copyWith(height: 1.6),
              ),
            ),
            onChanged: (val) {
              description = val;
            },
          ),
        ),
        SizedBox(
          height: 26,
        ),
        Text(
          "4. House rules:",
          style: header16.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 16.0,
          runSpacing: 15.0,
          children: [
            filterChiphousedesc("Smoking allowed"),
            filterChiphousedesc("chekin"),
            filterChiphousedesc("self chekin"),
            filterChiphousedesc("Luxury"),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Additional Rules:",
          style: header12medium,
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          width: double.infinity,
          height: 200,
          decoration: orangeoutlineboc,
          padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                "Enter a deetailed descriprion about the house and any information that is usefull ",
                style: header10.copyWith(height: 1.6),
              ),
            ),
            onChanged: (val) {
              addistionalrules = val;
            },
          ),
        ),
        SizedBox(
          height: 110,
        )
      ],
    );
  }
}

class filterChiphousedesc extends StatefulWidget {
  String filterChipTitle;
  filterChiphousedesc(this.filterChipTitle);

  @override
  State<filterChiphousedesc> createState() => _filterChiphousedescState();
}

class _filterChiphousedescState extends State<filterChiphousedesc> {
  var _isSelected = false;

  Color filtertextcolor = textcolorsecondary;

  @override
  Widget build(BuildContext context) {
    if (_isSelected == true) {
      filtertextcolor = theprimarycolor;
    } else {
      filtertextcolor = textcolorsecondary;
    }
    return FilterChip(
      showCheckmark: true,
      label: Text(
        widget.filterChipTitle,
        style: header12medium.copyWith(color: filtertextcolor),
      ),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      backgroundColor: linecolor,
      padding: EdgeInsets.fromLTRB(10, 17, 10, 17),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          if (isSelected == true) {
            selectedhouseruleslist.add(widget.filterChipTitle);
          } else if (isSelected == false) {
            selectedhouseruleslist.remove(widget.filterChipTitle);
          }
          print(selectedhouseruleslist);
        });
      },
      selectedColor: Color.fromARGB(43, 255, 60, 0),
    );
  }
}
