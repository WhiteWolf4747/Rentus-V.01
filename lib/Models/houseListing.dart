import 'dart:convert';

houseSpec placeholder = houseSpec(2, 2, 3);

class houseSpec {
  int guests;
  int rooms;
  int beds;

  houseSpec(this.beds, this.guests, this.rooms);
}

class HouseListing {
  String uid;
  String title;
  String subtitle;
  int rating;
  String description;
  List amenities;
  String location;
  List houserules;
  String housespecifications;
  int price;
  List imageurl;
  List bedrooms;
  String houseuid;

  HouseListing(
      {required this.uid,
      required this.title,
      required this.amenities,
      required this.description,
      required this.houserules,
      required this.housespecifications,
      required this.location,
      required this.price,
      required this.rating,
      required this.subtitle,
      required this.imageurl,
      required this.bedrooms,
      required this.houseuid});

  static HouseListing fromjson(Map<String, dynamic> json) => HouseListing(
      uid: json["uid"],
      title: json["Title"],
      amenities: json["Amenities"],
      description: json["Description"],
      houserules: json["House Rules"],
      housespecifications: json["House Specs"],
      location: json["Location"],
      price: json["Price"],
      rating: json["Rating"],
      subtitle: json["Subtitle"],
      imageurl: json["ImageURL"],
      bedrooms: json["Bedrooms"],
      houseuid: json["HouseUID"]);

  Map<String, dynamic> tojson() => {
        "uid": uid,
        "Title": title,
        "Subtitle": subtitle,
        "Rating": rating,
        "Description": description,
        "Amenities": amenities,
        "Location": location,
        "House Rules": houserules,
        "House Specs": housespecifications,
        "Bedrooms": bedrooms,
        "Price": price,
        "ImageURL": imageurl,
        "HouseUID": houseuid,
      };
}
