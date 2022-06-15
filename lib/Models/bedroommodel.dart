class bedroommodel {
  String bedType;
  String imageUrl;
  String roomNumber;

  bedroommodel(this.bedType, this.imageUrl, this.roomNumber);

  Map<String, dynamic> tojson() => {
        "bedType": bedType,
        "ImageUrl": imageUrl,
        "roomNumber": roomNumber,
      };
}
