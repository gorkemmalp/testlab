import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testlab/ayt.dart';
import 'package:testlab/kpss.dart';
import 'package:testlab/soru.dart';
import 'package:testlab/tyt.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/kpss": (context) => KpssView(),
      "/tyt": (context) => TytView(),
      "/ayt": (context) => AytView(),
      "/soru": (context) => SoruView(),
    },
  ));
}

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
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.only(bottom: 35),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/kpss');
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
/*
Container(
  child: MaterialButton(onPressed: () {
    Navigator.pushNamed(context, '/kpss');
  }),
),
*/

/*import 'package:flutter/material.dart';
import 'package:testlab/kpss.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/kpss": (context) => KpssView(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Century'),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 200,
            floating: true,
            title: Center(
                child: Text(
              "S I N A V  S E Ç İ M İ",
              style: TextStyle(fontSize: 35, color: Colors.white),
            )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    height: 1100,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            MaterialPageRoute(
                                builder: Navigator.pushNamed(context, "/kpss"));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.width / 1.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(40),
                            child: Stack(
                              children: <Widget>[
                                Image(
                                    image: AssetImage("assets/2_KPSS.png"),
                                    fit: BoxFit.contain),
                                Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "KPSS",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 50),
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: null,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.width / 1.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(40),
                            child: Stack(
                              children: <Widget>[
                                Image(
                                    image: AssetImage("assets/2_TYT.png"),
                                    fit: BoxFit.contain),
                                Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "TYT",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 50),
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: null,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.width / 1.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(40),
                            child: Stack(
                              children: <Widget>[
                                Image(
                                    image: AssetImage("assets/2_AYT.png"),
                                    fit: BoxFit.contain),
                                Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "AYT",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 50),
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ]),
      ),
    );
  }
}
*/

// İlk Tasarım

/*
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testlab/ImageView.dart';
import 'package:testlab/kpss.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/imageview": (context) => ImageView(),
      "/kpss": (context) => ImageView2(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 240,
              title: Center(
                  child: Text("S 21",
                      style: TextStyle(fontSize: 60, color: Colors.white))),
            ),
            SliverGrid.count(
              crossAxisCount: 1,
              childAspectRatio: 4 / 1,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                ),
              ],
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 9 / 16,
              children: [
                Container(
                  //01
                  margin: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: <Widget>[
                        Center(child: CircularProgressIndicator()),
                        Container(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width,
                            onPressed: () {
                              Navigator.pushNamed(context, '/kpss');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  //02
                  margin: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: <Widget>[
                        Center(child: CircularProgressIndicator()),
                        Container(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width,
                            onPressed: () {
                              Navigator.pushNamed(context, '/kpss');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testlab/ImageView.dart';
import 'package:testlab/kpss.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/imageview": (context) => ImageView(),
      "/kpss": (context) => KpssView(),
    },
  ));
}

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
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 200,
              floating: true,
              title: Center(
                  child: Text(
                "S I N A V  S E Ç İ M İ",
                style: TextStyle(fontSize: 37, color: Colors.white),
              )),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 9 / 16,
              children: [
                Container(
                  child: ClipRRect(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.grey,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width,
                            onPressed: () {
                              Navigator.pushNamed(context, '/kpss');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
