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
    return Hotel(
      id:json["sheet1"]["id"],
      name:json["sheet1"]["name"],
      price:json["sheet1"]["price"],
      rating:json["sheet1"]["rating"],
      imageUrl:json["sheet1"]["imageurl"],
      location: json["sheet1"]["location"]
    );
  }
}