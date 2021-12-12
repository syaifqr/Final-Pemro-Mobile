import 'package:flutter/material.dart';
import 'package:project_uas_flutter/main.dart';

// ignore: must_be_immutable
class Profil extends StatefulWidget {
  Profil({required this.email, required this.password, required this.username, required this.nama});
  
  String email;
  String password;
  String username;
  String nama;

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  TextEditingController conEmail = new TextEditingController(text: '$email');
  TextEditingController conNama = new TextEditingController(text: '$nama');
  TextEditingController conUsername = new TextEditingController(text: '$username');
  TextEditingController conPassword = new TextEditingController(text: '$password');

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {Navigator.of(context).pop();},
              );
            },
          ),
          
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top:50),
                  child: ClipOval(
                    child: Icon(Icons.person),
                          
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, top:20),
                child: Text(
                  'Email'
                ),
              ),
              Container(
                    margin: EdgeInsets.only(top: 10, left: 60, right: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: conEmail,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(left: 60, top:20),
                child: Text(
                  'Name'
                ),
              ),
              Container(
                    margin: EdgeInsets.only(top: 10, left: 60, right: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: conNama,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(left: 60, top:20),
                child: Text(
                  'Username'
                ),
              ),
              Container(
                    margin: EdgeInsets.only(top: 10, left: 60, right: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: conUsername,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.smartphone),
                      ),
                    ),
                  ),
              
              SizedBox(height: 10),
              
              SizedBox(height: 10),
              InkWell(
                onTap: () {Navigator.of(context).pushReplacementNamed('/login');},
                child: 
                  Center(
                    child: Container(
                        width: 200,
                        height: 50,
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.white)
                          ),
                        )
                      ),
                  ),
                  ),
              
              SizedBox(height: 10),
            ],
          )
        ),
      ),
    );
    
  }
}