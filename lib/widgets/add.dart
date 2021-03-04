import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsapp/models/hotel.dart';
class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  var hotelNameController = TextEditingController();
  var locationController = TextEditingController();
  var ratingController = TextEditingController();
  var priceController = TextEditingController();
  var imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: hotelNameController,
                decoration: InputDecoration(
                  hintText: "Enter the hotel name"
                ),
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                    hintText: "Enter the hotel location"
                ),
              ),
              TextField(
                controller: ratingController,
                decoration: InputDecoration(
                    hintText: "Enter the hotel rating"
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                    hintText: "Enter the hotel price"
                ),
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                    hintText: "Enter the image url"
                ),
              ),
              FlatButton(
                color: Colors.yellow,
                  onPressed: (){

                  createHotel(hotelNameController.text,
                      locationController.text,
                      ratingController.text,
                      priceController.text, imageController.text).then((value) =>
                  {
                    print(value)

                  });

              }, child: Text("Add a new hotel"))


            ],
          ),
        ),
      ),
    );
  }

  Future<Hotel> createHotel(String name, String location, String rating,
      String price, String imageUrl) async {
    print ("Here");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    var body = {
      'sheet1': {
        'name':name,
        'location':location,
        'star':rating,
        'price':price,
        'imageurl':imageUrl

      }

    };
    print(body);
    final response =  await http.post(
      'https://api.sheety.co/4db58997dd33ab7eaa3d621c48bdea06/hotels/sheet1',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer '+token
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200){
      return Hotel.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load hotel');
    }
  }
}
