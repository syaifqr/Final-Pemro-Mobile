import 'package:flutter/material.dart';
import 'package:project_uas_flutter/screens/part/button.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController pwController = new TextEditingController();

  void loginBuatUser() async {
    var url = "https://rorozorooo.000webhostapp.com/flutter_database/forlogin.php";
    var data = {
      "email" : emailController.text,
      "password" : pwController.text,
    };
    var response = await http.post(Uri.parse(url), body:data);
    var datauser = jsonDecode(response.body);

    if(datauser.length==0){
      Fluttertoast.showToast(
        msg:"Wrong Email & Password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
        msg: "Login success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.of(context).pushReplacementNamed("/home");
    setState(() {
      email = datauser[0]['email'];
      username = datauser[0]['username'];
      nama = datauser[0]['nama'];
      password = datauser[0]['password'];
      user = datauser[0]['username'];
    });
    }
    return datauser;
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Expanded(
          child: Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 150, bottom: 30),
                      child: Text('LOGIN',
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
                      child: ButtonWidget1(
                        onClick: () {
                          loginBuatUser();
                        },
                        btnText: "Login",
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "Don't have an account ? ", style: TextStyle(color: Colors.black)),
                    ]),
                  ),
                  Expanded(
                    child: Center(
                      child: ButtonWidget2(
                        onClick: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        btnText: "Register",
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
