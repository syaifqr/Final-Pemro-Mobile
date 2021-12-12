import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPlace extends StatefulWidget {
  late List list;
  late int index;
  DetailPlace({required this.index, required this.list});
  @override
  _DetailPlaceState createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {
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
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.network(
                    "https://rorozorooo.000webhostapp.com/flutter_database/uploads/${widget.list[widget.index]['image']}",
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 20),
                      child: Text("${widget.list[widget.index]['namaTempat']} \n${widget.list[widget.index]['lokasi']}", style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,))
                    )
                ],
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        'About This Place',
                        style: TextStyle(
                          fontFamily: 'Quantico',
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50, left: 20, right:20),
                      child: Text(
                        "${widget.list[widget.index]['deskripsi']}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        'Upload by',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "${widget.list[widget.index]['user']}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}