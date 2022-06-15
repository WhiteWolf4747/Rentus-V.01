import 'package:flutter/material.dart';
import 'package:flutter06/shared/classes.dart';
import 'package:flutter06/shared/styles.dart';

List allamenities = [
  "wifi",
  "tv",
  "kitchen",
  "parking",
  "heating",
  "smokingallowed",
  "breakfast",
  "washer",
  "dryer",
  "shower",
  "bathroom esentials",
  "petsallowed",
  "childrenallowed",
  "selfchekin",
  "pools",
  "airconditioning",
];

class amenities extends StatelessWidget {
  String amenityname;
  String amenityicon;
  amenities(this.amenityname, this.amenityicon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 52,
          width: 52,
          child: Image(image: AssetImage(amenityicon)),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          amenityname,
          style: header12bold,
        ),
      ],
    );
  }
}

class amenitiesall extends StatelessWidget {
  List amenitieslist;
  amenitiesall(this.amenitieslist);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: amenitieslist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext, index) {
          if (amenitieslist[index] == "wifi") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
                child: amenities("Wifi", "assets/amenities/wifi.jpg"));
          } else if (amenitieslist[index] == "kitchen") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
                child: amenities("Kitchen", "assets/amenities/kitchen.jpg"));
          } else if (amenitieslist[index] == "tv") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
                child: amenities("TV", "assets/amenities/tv.jpg"));
          } else if (amenitieslist[index] == "airconditioning") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
                child: amenities("Air Con", "assets/amenities/aircon.jpg"));
          } else if (amenitieslist[index] == "parking") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: amenities("Parking", "assets/amenities/parking.jpg"));
          } else if (amenitieslist[index] == "heat") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: amenities("Heating", "assets/amenities/heat.jpg"));
          } else if (amenitieslist[index] == "smoking") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: amenities(
                    "Smoking allowed", "assets/amenities/smoking.jpg"));
          } else if (amenitieslist[index] == "breakfast") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child:
                    amenities("Breakfast", "assets/amenities/breakfast.jpg"));
          } else if (amenitieslist[index] == "shower") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: amenities("Shower", "assets/amenities/shower.jpg"));
          } else if (amenitieslist[index] == "pets") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: amenities("Pets allowed", "assets/amenities/pets.jpg"));
          } else if (amenitieslist[index] == "selfchekin") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: amenities("Self chiken", "assets/amenities/pool.jpg"));
          } else if (amenitieslist[index] == "pool") {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: amenities("Pool", "assets/amenities/pool.jpg"));
          } else {
            return Container();
          }
        });
  }
}

class houserulesview extends StatelessWidget {
  List thehouserules;
  houserulesview(this.thehouserules);

  @override
  Widget build(BuildContext context) {
    return thehouserules.length != 0
        ? Column(
            children: [
              if (thehouserules.contains("smoking is not allowed")) ...[
                houseRules(Icons.not_interested_rounded, "Smoking not allowed ",
                    "Smoking is not allowed in this area")
              ],
              SizedBox(
                height: 10,
              ),
              if (thehouserules.contains("pets are not allowed")) ...[
                houseRules(Icons.pets, "Pets are not allowed ",
                    "Pets are not allowed in this area"),
              ],
              SizedBox(
                height: 10,
              ),
              if (thehouserules.contains("children allowed")) ...[
                houseRules(Icons.child_friendly_outlined, "Children Allowed",
                    "Children are allowed in this area "),
              ],
              SizedBox(
                height: 10,
              ),
              if (thehouserules.contains("events allowed")) ...[
                houseRules(Icons.event_available_outlined, "Events allowed ",
                    "Events are allowed in this area"),
              ],
              SizedBox(
                height: 10,
              ),
              if (thehouserules.contains("self chekin")) ...[
                houseRules(Icons.timelapse_outlined, "Self Chekin",
                    "You will chekin after booking the place "),
              ],
              SizedBox(
                height: 10,
              ),
            ],
          )
        : Text("No rules Set");
  }
}


/**
 for (var each in amenitieslist) {
      switch (each) {
        case "wifi":
          {
            return amenities("Wifi", "wifi/wifi.jpg");
          }
      }
    }

    for (var each in allamenities) {
      print(each);
      if (each == "wifis") {
        return amenities("Wifi", "assets/amenities/wifi.jpg");
      } else if (each == "kitchen") {
        return amenities("Kitchen", "assets/amenities/kitchen.jpg");
      } else if (each == "tv") {
        return amenities("TV", "assets/amenities/tv.jpg");
      } else if (each == "airconditioning") {
        return amenities("Air Conditioning", "assets/amenities/aircon.jpg");
      } else if (each == "parking") {
        return amenities("Parking", "assets/amenities/parking.jpg");
      } else if (each == "heat") {
        return amenities("Heating", "assets/amenities/heat.jpg");
      } else if (each == "smoking") {
        return amenities("Smoking allowed", "assets/amenities/smoking.jpg");
      } else if (each == "breakfast") {
        return amenities("Breakfast", "assets/amenities/breakfast.jpg");
      } else if (each == "shower") {
        return amenities("Shower", "assets/amenities/shower.jpg");
      } else if (each == "pets") {
        return amenities("Pets allowed", "assets/amenities/pets.jpg");
      } else if (each == "selfchekin") {
        return amenities("Self chiken", "assets/amenities/pool.jpg");
      } else if (each == "pool") {
        return amenities("Pool", "assets/amenities/pool.jpg");
      } else {
        print("object");
        return Container();
      }
    }
 */