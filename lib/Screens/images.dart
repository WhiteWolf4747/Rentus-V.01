import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:flutter06/Services/database.dart';
import 'package:flutter06/shared/classes.dart';

class imageview extends StatefulWidget {
  const imageview({Key? key}) : super(key: key);

  @override
  State<imageview> createState() => _imageviewState();
}

class _imageviewState extends State<imageview> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            FutureBuilder<HouseListing?>(
                future:
                    databaseService("uid").getsinglehouselisting("asdfasdf"),
                builder: (context, snaps) {
                  if (snaps.hasData) {
                    final userobj = snaps.data!;
                    print(userobj.title);

                    return Text(userobj.title);
                  } else {
                    return Text("data");
                  }
                }),
            ElevatedButton(
                onPressed: () async {
                  final filepicked = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ["png", 'jpg']);

                  if (filepicked == null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("data")));
                    return null;
                  }

                  final path = filepicked.files.single.path!;
                  final filename = filepicked.files.single.name;

                  print(path);
                  print(filename);

                  storageService()
                      .uploadFile(path, filename)
                      .then((value) => print("DONE"));
                },
                child: Text("UPLOAD")),
            featuredEachBlocks("assets/house02.jpg", "assets/four.jpg",
                "featuredTitle", "featuredprice"),
            featuredEachBlocks("assets/house02.jpg", "assets/four.jpg",
                "featuredTitle", "featuredprice"),
            FutureBuilder(
              future: storageService().imagelisturlsfromuid("imagestest"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snaps) {
                if (snaps.connectionState == ConnectionState.done) {
                  print(snaps.data!);
                  for (var each in snaps.data!) {
                    return Container(
                      height: 200,
                      child: Image.network(each),
                    );
                  }
                } else {
                  print("object");
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}

/*
FutureBuilder(
              future: storageService().imagelisturlsfromuid("imagestest"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snaps) {
                if (snaps.connectionState == ConnectionState.done) {
                  print(snaps.data!);
                  return Container(
                    child: Text("data"),
                  );
                } else {
                  print("object");
                }
                return Container();
              },
            )
 */