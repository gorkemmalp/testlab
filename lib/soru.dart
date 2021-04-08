import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SoruView extends StatefulWidget {
  @override
  _SoruViewState createState() => _SoruViewState();
}

class _SoruViewState extends State<SoruView> {
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
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 150,
                floating: false,
                title: Center(
                    child: Text(
                  "S  O  R  U",
                  style: TextStyle(fontSize: 60, color: Colors.white),
                )),
              ),
              SliverToBoxAdapter(
                //SORU
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Text(
                    "Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru Soru?",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                //ŞIKLAR
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              //A
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 180,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(1, 15, 15, 20), //LTRB
                              child: Row(children: <Widget>[
                                SizedBox(width: 15),
                                Text("A) ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                                Text("Şık 1",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                              ]),
                            ),
                            Container(
                              //C
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 180,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(1, 20, 15, 1), //LTRB
                              child: Row(children: <Widget>[
                                SizedBox(width: 15),
                                Text("C) ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                                Text("Şık 3",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                              ]),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              //B
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 180,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(15, 15, 1, 20), //LTRB
                              child: Row(children: <Widget>[
                                SizedBox(width: 15),
                                Text("B) ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                                Text("Şık 2",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                              ]),
                            ),
                            Container(
                              //D
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 180,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(15, 20, 1, 1), //LTRB
                              child: Row(children: <Widget>[
                                SizedBox(width: 15),
                                Text("D) ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                                Text("Şık 4",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22)),
                              ]),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 7.8,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: 150,
                      height: 50,
                      child: Center(
                        child: Text("Cevabı Gör",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                            textAlign: TextAlign.center),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
