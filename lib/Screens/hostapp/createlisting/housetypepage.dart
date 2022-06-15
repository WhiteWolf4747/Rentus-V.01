import 'package:flutter/material.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';

List selectedamenities = [];

class housetypepage extends StatefulWidget {
  const housetypepage({Key? key}) : super(key: key);

  @override
  State<housetypepage> createState() => _housetypepageState();
}

class _housetypepageState extends State<housetypepage> {
  var housespaces = ["Entire House", "Shared Room", "Privare Room"];
  var housetype = ["Villa", "Pension", "Apartment", "Hotel", "B&B"];

  String selectedhousespace = 'Entire House';
  String selectedhousetype = 'Villa';

  @override
  Widget build(BuildContext context) {
    print(selectedamenities);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "1. What space are you listing?",
          style: header16.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 14,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: linedboxdec,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: theprimarycolor,
                  value: selectedhousespace,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: header12bold.copyWith(color: theprimarycolor),
                  items: housespaces.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: header12medium,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedhousespace = newValue!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        //--
        SizedBox(
          height: 20,
        ),
        Text(
          "2. What Kind of house?",
          style: header16.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: linedboxdec,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: theprimarycolor,
                  value: selectedhousetype,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: header12bold.copyWith(color: theprimarycolor),
                  items: housetype.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: header12medium,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedhousetype = newValue!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "3. Select available amenities: ",
          style: header16.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 14,
        ),
        Wrap(
          spacing: 16.0,
          runSpacing: 15.0,
          children: [
            filterChipnew("Wifi"),
            filterChipnew("Bed and Breakfast"),
            filterChipnew("TV"),
            filterChipnew("Luxury"),
            filterChipnew("Kitchen")
          ],
        ),
        SizedBox(
          height: 120,
        )
      ],
    );
  }
}

class filterChipnew extends StatefulWidget {
  final String filterChipTitle;
  filterChipnew(this.filterChipTitle);

  @override
  State<filterChipnew> createState() => _filterChipnewState();
}

class _filterChipnewState extends State<filterChipnew> {
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
          if (isSelected) {
            selectedamenities.add(widget.filterChipTitle);
          } else if (selectedamenities.contains(widget.filterChipTitle) &&
              !isSelected) {
            selectedamenities.remove(widget.filterChipTitle);
          }
          print(selectedamenities);
        });
      },
      selectedColor: Color.fromARGB(43, 255, 60, 0),
    );
  }
}


/**
 housetype.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem(value: item, child: Text("data"));
                  }).toList()
 */
