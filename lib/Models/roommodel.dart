class roommodel {
  String bedtype;
  String roomnumber;
  String imageurl;

  roommodel(this.bedtype, this.roomnumber, this.imageurl);

  Map<String, dynamic> tojson() => {
        "bedType": bedtype,
        "ImageUrl": imageurl,
        "roomNumber": roomnumber,
      };
}
