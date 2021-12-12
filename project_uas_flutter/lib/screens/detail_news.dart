import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailNews extends StatefulWidget {
  late List list;
  late int index;
  DetailNews({required this.index, required this.list});

  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
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
                    child: Image.network(
                    "https://rorozorooo.000webhostapp.com/flutter_database/uploadBerita/${widget.list[widget.index]['image']}",
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50, left: 40, right: 40),
                      child: Text(
                        "${widget.list[widget.index]['judul']}",
                        style: TextStyle(
                          fontSize: 20,
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
                        'Source from',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "${widget.list[widget.index]['sumber']}",
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