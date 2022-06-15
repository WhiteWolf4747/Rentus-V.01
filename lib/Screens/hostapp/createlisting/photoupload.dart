import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';
import 'package:image_picker/image_picker.dart';

List uploadedurlimageslist = [];
String? passportidurl;

class photouploadpage extends StatefulWidget {
  const photouploadpage({Key? key}) : super(key: key);

  @override
  State<photouploadpage> createState() => _photouploadpageState();
}

class _photouploadpageState extends State<photouploadpage> {
  final ImagePicker imagePicker = ImagePicker();
  UploadTask? uploadTask;
  List<XFile>? imageFileList = [];
  XFile? idimagefile;

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }

    setState(() {});
  }

  Future uploadimage(File thefile) async {
    //replace with current uif
    final path =
        "HouseImages/6rYsZ1a8HtcSPN8OS5eISZaYEI72/${thefile.path.split("/").last}";
    print(uploadedurlimageslist);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(thefile);

    final snap = await uploadTask!.whenComplete(() {});
    final urlimages = await snap.ref.getDownloadURL();
    uploadedurlimageslist.add(urlimages);
  }

  Future uploadallimages() async {
    if (imageFileList!.length != 0) {
      for (var each in imageFileList!) {
        final thefile = File(each.path);
        uploadimage(thefile);
      }
    } else {
      print("object");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(uploadedurlimageslist);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "1. Upload at least 5 photos:",
              style: header16.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        if (imageFileList!.length != 0) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: imageFileList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(File(imageFileList![index].path),
                      fit: BoxFit.cover);
                }),
          )
        ] else ...[
          InkWell(
            onTap: selectImages,
            child: Image(
              image: AssetImage("assets/imageplaceholder.jpg"),
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
        ],
        SizedBox(
          height: 20,
        ),
        Container(
            child: imageFileList!.length <= 3
                ? InkWell(
                    onTap: selectImages,
                    child: createlistingbtn("Select at least 5 images"))
                : InkWell(
                    onTap: () {
                      print(imageFileList);
                      uploadallimages();
                      print(uploadedurlimageslist);
                    },
                    child: createlistingbtn("Upload Images"),
                  )),
        SizedBox(
          height: 30,
        ),
        Text(
          "2. Upload Government ID:",
          style: header16.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: idimagefile == null
              ? InkWell(
                  onTap: () async {
                    idimagefile = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    print(idimagefile!.path);
                    final ref = FirebaseStorage.instance
                        .ref()
                        .child("HouseImages/6rYsZ1a8HtcSPN8OS5eISZaYEI72/");
                    uploadTask = ref.putFile(File(idimagefile!.path));

                    final snapd = await uploadTask!.whenComplete(() {});
                    final urlimage = await snapd.ref.getDownloadURL();
                    setState(() {
                      passportidurl = urlimage;
                    });
                  },
                  child:
                      Image(image: AssetImage("assets/imageplaceholder.jpg")))
              : Image.file(
                  File(idimagefile!.path),
                  fit: BoxFit.cover,
                  height: 200,
                ),
        ),
        SizedBox(
          height: 120,
        )
      ],
    );
  }
}


/**
 * class photouploadpage extends StatelessWidget {
  const photouploadpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1. Upload at least 5 photos:",
                  style: header14,
                ),
                InkWell( child: createlistingbtn("select image"))
              ],
            ),
            imagepicker(),
            SizedBox(
              height: 14,
            ),
          ],
        )
      ],
    );
  }
}
 */