import 'package:flutter/material.dart';
import 'package:project_uas_flutter/screens/part/button.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController pwController = new TextEditingController();

  void registerUser() async {
    var url = "https://rorozorooo.000webhostapp.com/flutter_database/register.php";
    var data = {
      "email" : emailController.text,
      "password" : pwController.text,
      "username" : usernameController.text,
      "nama" : nameController.text
    };
    var response = await http.post(Uri.parse(url),
    body:data);

    if (jsonDecode(response.body) == "Error") {
      Fluttertoast.showToast(
        msg: "This user already exists!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }else {
      if(jsonDecode(response.body) == "true") {
        Fluttertoast.showToast(
          msg: "Registration successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
        );
      } else {
        Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade600,
          textColor: Colors.white,
          fontSize: 16.0
        );
      }
    
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 100, bottom: 30),
                        child: Text('REGISTER',
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 48.0,
                              fontFamily: 'Quantico',
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                            prefixIcon: Icon(Icons.smartphone),
                          ),
                        ),
                      ),
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          obscureText: true,
                          controller: pwController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.vpn_key),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget2(
                          onClick: () {
                            registerUser();
                          },
                          btnText: "Register",
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: "Do you have an account ? ", style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget1(
                          onClick: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          btnText: "Login",
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          );
  }

  
}
