import 'package:flutter/material.dart';
import 'package:project_uas_flutter/screens/home.dart';
import 'package:project_uas_flutter/screens/login.dart';
import 'package:project_uas_flutter/screens/profil.dart';
import 'package:project_uas_flutter/screens/register.dart';
import 'package:project_uas_flutter/screens/upload.dart';

void main() {
  runApp(MyApp());
}

String email ="";
String password="";
String username="";
String nama="";
String user="";
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Natureco',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      routes: {
          '/login': (BuildContext ctx) => Login(),
          '/register': (BuildContext ctx) => Register(),
          '/home': (BuildContext ctx) => Home(),
          '/profil': (BuildContext ctx) => Profil(email: email, password: password, username: username, nama: nama,),
          '/upload': (BuildContext ctx) => UploadPage()
        }
    );
  }
}

