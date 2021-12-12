import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({ Key? key }) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final imagePicker = ImagePicker();
  File? imageFile;

  TextEditingController namaController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController deskripsiController = new TextEditingController();
  TextEditingController userController = new TextEditingController();  

  Future chooseImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(pickedImage!.path);
    });
  }
  
  Future startUpload() async{
    final url = Uri.parse("https://rorozorooo.000webhostapp.com/flutter_database/upload.php");
    var request = http.MultipartRequest('POST', url);
    request.fields['namaTempat'] = namaController.text;
    request.fields['lokasi'] = locationController.text;
    request.fields['deskripsi'] = deskripsiController.text;
    request.fields['user'] = userController.text;
    var pic = await http.MultipartFile.fromPath("image", imageFile!.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Upload successfull",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.of(context).pushNamed("/home");
    }else {
      Fluttertoast.showToast(
        msg: "Failed to upload",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }
  
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
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 20,top: 30),
                child: Text(
                  'UPLOAD IMAGE \nAND SHARE \nYOUR STORY',
                  style: TextStyle(fontSize: 40, fontFamily: 'Quantico')
                ),
              ),
              InkWell(
                onTap: () {chooseImage();},
                child: Center(
                  child: Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 10, bottom: 20, left: 60, right: 60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.teal,
                        ),
                        child: Center(
                          child: Text(
                            'Choose Image',
                            style: TextStyle(color: Colors.white)
                          ),
                        )
                      ),
                    ),
                  ),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: imageFile == null ? Text('No Image Selected') : Image.file(imageFile!),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                    margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: namaController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name of Destination',
                      ),
                    ),
                  ),
              Container(
                    margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: locationController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Location of Destination',
                      ),
                    ),
                  ),
              Container(
                    margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: deskripsiController,
                      maxLines:5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Description',
                      ),
                    ),
                  ),
              Container(
                    margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {startUpload();},
                child: Center(
                  child: Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 10, bottom: 20, left: 60, right: 60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white)
                          ),
                        )
                      ),
                    ),
                  ),
              SizedBox(height: 20),
              
            ],
          )
        ),
      ),
    );
  }
}