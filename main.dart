import 'package:flutter/material.dart';
import './api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: new ListViewBuilder()
    );
  }
}


class ListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
            FutureBuilder<dynamic>(
                future: Api().getDetails(),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                      return
                        GestureDetector(
                          child:
                          Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                        ),
                                        height: 85,
                                        /*child: SvgPicture.asset(
                                            "assets/Language icon/Chennai.svg",
                                            color: Colors.grey),*/
                                      ),
                                      Positioned(
                                        child: Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.4),
                                              borderRadius:
                                              BorderRadius.circular(18.0),
                                            ),
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.green,
                                              child: Icon(
                                                Icons.check,
                                                size: 15,
                                              ),
                                            )),
                                        top: 0.0,
                                        right: 0.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.data[0],
                               /* style: GoogleFonts.poppins(
                                    fontSize: 15, color: Color(0xFFb6b9c5)),*/
                              ),
                            ],
                          ),
                      /*    onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => City()));
                          }*/);
                    /*    ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return  ListTile(
                                title:Text( snapshot.data[index])
                            );
                      });*/

                  } else { return Center(
                    child: Text("No data",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                  );}
                })


    );
  }
}