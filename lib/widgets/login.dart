import 'package:flutter/material.dart';
import 'package:hotelsapp/widgets/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Image.network("https://s3-ap-southeast-1.amazonaws.com/traveloka/imageResource/2017/03/17/1489744198907-356bed3012407aaa8f07132704bd7e66.png"),
              SizedBox(height: 10),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Enter your username",
                  border: OutlineInputBorder(),

                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
    hintText: "Enter your password",
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              FlatButton(onPressed: () async {
                if (usernameController.text =="admin" && passwordController.text == "password"){
                  print("success");
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString("token", "ifyouhavethispasswordonlycancallme");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuPage()));
                }
                else {

                  // TODO : Add a toast
                  print("error");
                }

                }
                , child: Text("Login"), color: Colors.yellow,)

            ],
          ),
        ),
      ),
    );
  }
}
