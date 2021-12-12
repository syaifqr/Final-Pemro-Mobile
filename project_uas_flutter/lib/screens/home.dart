import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas_flutter/screens/detail_news.dart';
import 'package:project_uas_flutter/screens/detail_place.dart';

import '../main.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {Navigator.of(context).pushNamed('/upload');}, 
                icon: Icon(Icons.add_circle_outline, color: Colors.white)
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.home, color: Colors.black)
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.green,
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Text('Menu Drawer')
                  )
                ),
                InkWell(
                  onTap: () {Navigator.of(context).pushNamed('/home');},
                  child: ListTile(
                    title: Text('Home', style: TextStyle(color: Colors.white),
                    )
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context).pushReplacementNamed('/login');},
                  child: ListTile(
                    title: Text('Logout', style: TextStyle(color: Colors.black),)
                  ),
                )
              ],
            ),
          )
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {Navigator.of(context).pushNamed('/profil');},
            )
          ],
        ),
        body: Container(
          height: size.height,
          child: SingleChildScrollView(
            
            child: RecomScroller()
          ),
        ),
      ),
    );
  }
}

class RecomScroller extends StatefulWidget {
  const RecomScroller({ Key? key }) : super(key: key);

  @override
  _RecomScrollerState createState() => _RecomScrollerState();
}

class _RecomScrollerState extends State<RecomScroller> {

  Future allDestination() async {
    var url = "https://rorozorooo.000webhostapp.com/flutter_database/view.php";
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  Future allNews() async {
    var url = "https://rorozorooo.000webhostapp.com/flutter_database/view_berita.php";
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final double recomHeight = MediaQuery.of(context).size.height * 0.3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20,top: 30),
          child: Text(
            'WELCOME \n$user',
            style: TextStyle(fontSize: 40, fontFamily: 'Quantico')
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            'Recomendation'
          ),
        ),
        SizedBox(
          height: recomHeight,
          child: FutureBuilder(
            future: allDestination(),
            builder: (context, AsyncSnapshot snapshot){
              if (snapshot.hasError){
                return Center(child: Text('${snapshot.error}'),);
              } else if (snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){ 
                    List list = snapshot.data;
                  return Container(
                    height: recomHeight,
                    width: 150,
                    margin: EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {Navigator.of(context).push(
                        new MaterialPageRoute(builder: (BuildContext context)=> 
                        new DetailPlace(index: index, list: list)));},
                      child: Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                            "https://rorozorooo.000webhostapp.com/flutter_database/uploads/${list[index]["image"]}",
                            height: recomHeight,
                            width: 150.0,
                            fit: BoxFit.cover,
                            ),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 10),
                            child: Text(
                              "${list[index]['namaTempat']} \n${list[index]['lokasi']}", 
                              style: TextStyle(color: Colors.white,
                              ),
                            ),
                          )
                        ],
                        
                      ),
                    ),
                    
                  );
                  });
              }else return Center(
                  child: CircularProgressIndicator(),
                );
             
          },)
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            'Breaking News'
          ),
        ),
        Flexible(
          child: FutureBuilder(
            future: allNews(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError){
                return Center(child: Text('${snapshot.error}'),);
              } else if (snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                  return InkWell(
                    onTap: () {Navigator.of(context).push(
                        new MaterialPageRoute(builder: (BuildContext context)=> 
                        new DetailNews(index: index, list: list)));},
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25), 
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(5),
                        ), 
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  "https://rorozorooo.000webhostapp.com/flutter_database/uploadBerita/${list[index]["image"]}",
                                  height: 70.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                  ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        child: Text(
                                          '${list[index]['judul']}', 
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: false,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        '${list[index]['deskripsi']}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        softWrap: false,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } 
                  
                );
              } else return Center(
                  child: CircularProgressIndicator(),
                );
            }
            
          )
          ),
        
      ],
    );
  }
}
