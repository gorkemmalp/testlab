import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testlab/kpss.dart';
import 'package:testlab/tyt.dart';
import 'package:testlab/ayt.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Century'),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.blueGrey,
                  Colors.black,
                  Colors.blueGrey,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.15, 0.4, 075, 0.9]),
          ),
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 230,
              floating: false,
              title: Center(
                  child: Text("S I N A V  S E Ç İ M İ",
                      style: TextStyle(color: Colors.white, fontSize: 37))),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.only(bottom: 35),
                    child: MaterialButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, "/kpss");
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new KpssView(),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/2_KPSS.png"),
                              fit: BoxFit.contain),
                          Container(
                              margin: EdgeInsets.only(bottom: 30),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "KPSS",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: MaterialButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/tyt');
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new TytView(),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/2_TYT.png"),
                              fit: BoxFit.contain),
                          Container(
                              margin: EdgeInsets.only(bottom: 30),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "TYT",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: MaterialButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/ayt');
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new AytView(),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/2_AYT.png"),
                              fit: BoxFit.contain),
                          Container(
                              margin: EdgeInsets.only(bottom: 30),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "AYT",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}



/*

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Century'),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.blueGrey,
                  Colors.black,
                  Colors.blueGrey,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.15, 0.4, 075, 0.9]),
          ),
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 230,
              floating: false,
              title: Center(
                  child: Text("S I N A V  S E Ç İ M İ",
                      style: TextStyle(color: Colors.white, fontSize: 37))),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.only(bottom: 35),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/kpss");
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/2_KPSS.png"),
                              fit: BoxFit.contain),
                          Container(
                              margin: EdgeInsets.only(bottom: 30),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "KPSS",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/tyt');
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/2_TYT.png"),
                              fit: BoxFit.contain),
                          Container(
                              margin: EdgeInsets.only(bottom: 30),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "TYT",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ayt');
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/2_AYT.png"),
                              fit: BoxFit.contain),
                          Container(
                              margin: EdgeInsets.only(bottom: 30),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "AYT",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


*/