import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter06/Models/bedroommodel.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:image_picker/image_picker.dart';

Decoration linedboxdecnew = BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: linecolor,
      width: 1.6,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)));

int selectedbathrooms = 0;
int selectedguests = 0;
String pricepernight = ""; // check if input is valid
List bedroomslist = [
  [0, 0, 0, 0]
];
List finalbedroomslist = [];

class housedetailpage extends StatefulWidget {
  @override
  State<housedetailpage> createState() => _housedetailpageState();
}

class _housedetailpageState extends State<housedetailpage> {
  int numberofbedsinput = 1;

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "1. Bedrooms:",
              style: header16.copyWith(fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  numberofbedsinput += 1;
                  bedroomslist.add([0, 0, 0, 0]);
                });
              },
              child: createlistingbtn("Add Beds"),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),

        //---
        //the beds list

        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: numberofbedsinput,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Room ${index + 1}: ",
                        style: header14.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.7,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              numberofbedsinput -= 1;
                              bedroomslist.removeAt(index);
                            });
                          },
                          child: Icon(
                            Icons.cancel,
                            color: textcolorprimary,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "- Queen",
                        style:
                            header14light.copyWith(fontWeight: FontWeight.w500),
                      ),
                      counternumsbedrooms("queen", index)
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- King",
                        style:
                            header14light.copyWith(fontWeight: FontWeight.w500),
                      ),
                      counternumsbedrooms("king", index)
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- Normal",
                        style:
                            header14light.copyWith(fontWeight: FontWeight.w500),
                      ),
                      counternumsbedrooms("normal", index)
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "- Double",
                        style:
                            header14light.copyWith(fontWeight: FontWeight.w500),
                      ),
                      counternumsbedrooms("doublebed", index)
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            );
          },
        ),

        //---

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "2. Bathrooms:",
              style: header16.copyWith(fontWeight: FontWeight.w500),
            ),
            counternums("bathrooms")
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "3. Guests:",
              style: header16.copyWith(fontWeight: FontWeight.w500),
            ),
            counternums("guests")
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "4. Price per night:",
              style: header16.copyWith(fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                textinputttt(),
                Text(
                  " /night",
                  style: header12medium.copyWith(color: textcolorsecondary),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 140,
        )
      ],
    );
  }
}

class counternums extends StatefulWidget {
  String count;
  counternums(this.count);

  @override
  State<counternums> createState() => _counternumsState();
}

class _counternumsState extends State<counternums> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                switch (widget.count) {
                  case "bathrooms":
                    selectedbathrooms += 1;
                    break;
                  case "guests":
                    selectedguests += 1;
                    break;
                }
              });
            },
            child: Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: linecolor),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    bottomLeft: Radius.circular(6.0)),
                color: Colors.white,
              ),
              child: Icon(
                Icons.add,
                color: textcolorsecondary,
                size: 20,
              ),
            ),
          ),
          if (widget.count == "bathrooms") ...[
            countcontent(selectedbathrooms)
          ] else if (widget.count == "guests") ...[
            countcontent(selectedguests)
          ],
          InkWell(
            onTap: () {
              setState(() {
                switch (widget.count) {
                  case "bathrooms":
                    selectedbathrooms -= 1;
                    break;
                  case "guests":
                    selectedguests -= 1;
                    break;
                }
              });
            },
            child: Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: linecolor),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6.0),
                    bottomRight: Radius.circular(6.0)),
                color: Colors.white,
              ),
              child: Icon(
                Icons.remove,
                color: textcolorsecondary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class counternumsbedrooms extends StatefulWidget {
  String bedtype;
  int index;
  counternumsbedrooms(this.bedtype, this.index);

  @override
  State<counternumsbedrooms> createState() => _counternumsbedroomsState();
}

class _counternumsbedroomsState extends State<counternumsbedrooms> {
  int queen = 0;
  int king = 0;
  int normal = 0;
  int doublebed = 0;

  List placeholderbedroomlist = [0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  switch (widget.bedtype) {
                    case "queen":
                      queen += 1;
                      bedroomslist[widget.index][0] = queen;
                      break;
                    case "king":
                      king += 1;
                      bedroomslist[widget.index][1] = king;
                      break;
                    case "normal":
                      normal += 1;
                      bedroomslist[widget.index][2] = normal;
                      break;
                    case "doublebed":
                      doublebed += 1;
                      bedroomslist[widget.index][3] = doublebed;
                      break;
                  }

                  print(bedroomslist);
                });
              },
              child: Container(
                height: 30,
                width: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: linecolor),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      bottomLeft: Radius.circular(6.0)),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.add,
                  color: textcolorsecondary,
                  size: 20,
                ),
              ),
            ),
            if (widget.bedtype == "queen") ...[
              countcontent(queen)
            ] else if (widget.bedtype == "king") ...[
              countcontent(king)
            ] else if (widget.bedtype == "normal") ...[
              countcontent(normal)
            ] else if (widget.bedtype == "doublebed") ...[
              countcontent(doublebed)
            ],
            InkWell(
              onTap: () {
                setState(() {
                  switch (widget.bedtype) {
                    case "queen":
                      queen -= 1;
                      bedroomslist[widget.index][0] = queen;
                      break;
                    case "king":
                      king -= 1;
                      bedroomslist[widget.index][1] = king;
                      break;
                    case "normal":
                      normal -= 1;
                      bedroomslist[widget.index][2] = normal;
                      break;
                    case "doublebed":
                      doublebed -= 1;
                      bedroomslist[widget.index][3] = doublebed;
                      break;
                  }

                  print(bedroomslist);
                  print(finalbedroomslist);
                });
              },
              child: Container(
                height: 30,
                width: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: linecolor),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0)),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.remove,
                  color: textcolorsecondary,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        if (bedroomslist[widget.index][0] != 0 &&
            widget.bedtype == "queen") ...[
          imageuploadview("Queen", widget.index)
        ] else if (bedroomslist[widget.index][1] != 0 &&
            widget.bedtype == "king") ...[
          imageuploadview("King", widget.index)
        ] else if (bedroomslist[widget.index][2] != 0 &&
            widget.bedtype == "normal") ...[
          imageuploadview("Normal", widget.index)
        ] else if (bedroomslist[widget.index][3] != 0 &&
            widget.bedtype == "doublebed") ...[
          imageuploadview("Double", widget.index)
        ]
      ],
    );
  }
}

class imageuploadview extends StatefulWidget {
  int index;
  String bedtype;
  imageuploadview(this.bedtype, this.index);

  @override
  State<imageuploadview> createState() => _imageuploadviewState();
}

class _imageuploadviewState extends State<imageuploadview> {
  final ImagePicker imagePicker = ImagePicker();
  UploadTask? uploadTask;
  XFile? idimagefile;
  String? bedidurl;
  List<XFile>? imageFileList = [];

  @override
  Widget build(BuildContext context) {
    if (imageFileList!.length == 0) {
      return InkWell(
          onTap: () async {
            final List<XFile>? selectedImages =
                await imagePicker.pickMultiImage();
            if (selectedImages!.isNotEmpty) {
              setState(() {
                imageFileList!.addAll(selectedImages);
              });
            }
            //print(imageFileList);

            for (var each in imageFileList!) {
              final ref = FirebaseStorage.instance.ref().child(
                  "HouseImages/6rYsZ1a8HtcSPN8OS5eISZaYEI72/${each.path.split("/").last}");
              //print(each.path);
              uploadTask = ref.putFile(File(each.path));
              final snapd = await uploadTask!.whenComplete(() {});
              final urlimage = await snapd.ref.getDownloadURL();

              setState(() {
                bedroommodel newbed = bedroommodel(
                    widget.bedtype, urlimage, "Bedroom ${widget.index}");

                finalbedroomslist.add(newbed.tojson());
                //print(finalbedroomslist[0].imageUrl);
                //print(finalbedroomslist[0].bedType);
              });
            }
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Row(
              children: [
                Text(
                  "Upload \nImage:",
                  style: header10,
                ),
                SizedBox(
                  width: 8,
                ),
                Image(
                  image: AssetImage("assets/map.jpg"),
                  width: 60,
                ),
              ],
            ),
          ));
    } else {
      return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: imageFileList!.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Image.file(
              File(imageFileList![index].path),
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            );
          });
    }
  }
}

class textinputttt extends StatelessWidget {
  const textinputttt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: linecolor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "\$",
            hintStyle: header12medium.copyWith(height: 1.6)),
        onChanged: (input) {
          pricepernight = input;
        },
      ),
    );
  }
}

class countcontent extends StatelessWidget {
  int num;
  countcontent(this.num);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 207, 209, 251),
        border: Border.all(color: linecolor),
      ),
      child: Center(
          child: Text(
        num.toString(),
        style: header12medium,
      )),
    );
  }
}

/**
 
ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: numberofbedsinput,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Room ${beds + 1} "),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  numberofbedsinput -= 1;
                                });
                              },
                              child: Icon(Icons.cancel))
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Queen",
                            style: header12medium,
                          ),
                          counternums(beds)
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "King",
                            style: header12medium,
                          ),
                          counternums(beds)
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Normal",
                            style: header12medium,
                          ),
                          counternums(beds)
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                );
              },
            ),

 */
