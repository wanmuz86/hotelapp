class Hotel {
  final int id;
  final String name;
  final String location;
  final int rating;
  final String imageUrl;
  final String price;

  Hotel({this.id, this.name, this.location, this.rating, this.imageUrl, this.price});

  factory Hotel.fromJson(Map<String,dynamic> json){
    print(json);
    var jsonToProcess = json;
    // For add , since it comes in a sheet1
    if (json["sheet1"]!=null){
      jsonToProcess = json["sheet1"];
    }
    return Hotel(
      id:jsonToProcess["id"],
      name:jsonToProcess["name"],
      price:jsonToProcess["price"],
      rating:jsonToProcess["rating"],
      imageUrl:jsonToProcess["imageurl"],
      location: jsonToProcess["location"]
    );
  }
}