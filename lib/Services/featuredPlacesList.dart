import 'package:flutter/material.dart';
import 'package:flutter06/Models/houseListing.dart';
import 'package:provider/provider.dart';
import 'package:flutter06/shared/classes.dart';

class featuredlist extends StatefulWidget {
  const featuredlist({Key? key}) : super(key: key);

  @override
  State<featuredlist> createState() => _featuredlistState();
}

class _featuredlistState extends State<featuredlist> {
  @override
  Widget build(BuildContext context) {
    dynamic housestreamrec = Provider.of<List<HouseListing>?>(context) ?? [];

    //url which isnt available in the house listing object by using its uid to get the image(s)(meaning images will have uid identifier) and
    //the getimageurl function would be edited include that parameter... legizew create a image with uid manually for testing
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisExtent: 256,
      ),
      shrinkWrap: true,
      itemCount: housestreamrec.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return featuredEachBlocksnew(
            housestreamrec[index].imageurl[0],
            "assets/5star01.png",
            housestreamrec[index].title,
            housestreamrec[index].price.toString(),
            housestreamrec[index].houseuid);
      },
    );
  }
}

/*ListView.builder(
      itemCount: housestreamrec.length,
      itemBuilder: (context, index) {
        return Container(child: Text(housestreamrec[index].uid));
      },
    ); 
    
    
    ElevatedButton(
            onPressed: () {
              databaseService("uid").updateData(
                  "fromterminal",
                  "title",
                  "subtitile",
                  3,
                  "asdfsgfasdf",
                  ["amenities"],
                  "location",
                  ["houserules"],
                  2);
            },
            child: Text("Add user see if it refreshes"))*/
