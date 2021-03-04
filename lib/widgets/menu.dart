import 'package:flutter/material.dart';
import 'package:hotelsapp/widgets/add.dart';
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu"),),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    },

                  child: Container(
                    color: Colors.yellow,
                    height: 100,
                    child: Text("List"),
                    
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: ((context)=>AddPage())));
                  },

                  child: Container(
                    color: Colors.yellow,
                    height: 100,
                    child: Text("Add"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
           GestureDetector(

              onTap: (){
              },

              child: Container(
                height: 100,
                width: 150,
                color: Colors.yellow,
                child: Text("Manage"),

              ),

          ),
        ],
      ),
    );
  }
}
