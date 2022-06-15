class normalaccountmodel {
  String username;
  String imageurl;

  normalaccountmodel({required this.imageurl, required this.username});

  static normalaccountmodel fromjson(Map<String, dynamic> json) =>
      normalaccountmodel(
          imageurl: json['imageurl'], username: json["username"]);

  Map<String, dynamic> tojson() => {"username": username, "imageurl": imageurl};
}
