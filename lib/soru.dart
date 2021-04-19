import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

String lessonPick = "";
SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;

class SoruView extends StatefulWidget {
  @override
  _SoruViewState createState() => _SoruViewState();
}

class _SoruViewState extends State<SoruView> {
  var questionText = "";
  var aText = "";
  var bText = "";
  var cText = "";
  var dText = "";
  var answerText = "";
  bool asked = false;
  int questionNumber;
  String answerControl = "";
  bool answered = false;

  int matTrue, matFalse, matTotal;

  Color aColor = Colors.transparent,
      bColor = Colors.transparent,
      cColor = Colors.transparent,
      dColor = Colors.transparent;

  String pickAQuestion() {
    Random random = new Random();
    questionNumber = random.nextInt(5);
    return questionNumber.toString();
  }

  getQuestion() {
    FirebaseFirestore.instance
        .collection(lessonPick)
        .doc(pickAQuestion())
        .get()
        .then((incomingQuestion) {
      setState(() {
        asked = incomingQuestion.data()['asked'];
        if (!asked) {
          matTotal++;
          questionText = incomingQuestion.data()['soru'];
          aText = incomingQuestion.data()['a'];
          bText = incomingQuestion.data()['b'];
          cText = incomingQuestion.data()['c'];
          dText = incomingQuestion.data()['d'];
          bText = incomingQuestion.data()['b'];
          answerText = incomingQuestion.data()['cevap'];
          setAsked();
        } else {
          getQuestion();
        }
      });
    });
  }

  setAsked() {
    FirebaseFirestore.instance
        .collection(lessonPick)
        .doc(questionNumber.toString())
        .update({'asked': true});
  }

  askControl() {
    if (answerControl == answerText) {
      //Doğru
      if (!answered) {
        matTrue++;
      }
      if (answerControl == "Cevap: A")
        setState(() {
          aColor = Colors.green;
        });
      else if (answerControl == "Cevap: B")
        setState(() {
          bColor = Colors.green;
        });
      else if (answerControl == "Cevap: C")
        setState(() {
          cColor = Colors.green;
        });
      else if (answerControl == "Cevap: D")
        setState(() {
          dColor = Colors.green;
        });
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(60),
                ),
                height: MediaQuery.of(context).size.width / 5,
                margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Tebrikler! ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 40)),
                        SizedBox(width: 5),
                        Icon(Icons.check, color: Colors.white, size: 50),
                      ]),
                ),
              ),
            );
          });
      new Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new SoruView(),
          ),
        );
      });
    } else {
      //Yanlış
      if (!answered) {
        matFalse++;
      }
      if (answerControl == "Cevap: A")
        setState(() {
          aColor = Colors.red;
        });
      else if (answerControl == "Cevap: B")
        setState(() {
          bColor = Colors.red;
        });
      else if (answerControl == "Cevap: C")
        setState(() {
          cColor = Colors.red;
        });
      else if (answerControl == "Cevap: D")
        setState(() {
          dColor = Colors.red;
        });
    }
  }

  wipeAsked() {
    FirebaseFirestore.instance
        .collection(lessonPick)
        .doc(questionNumber.toString())
        .update({'asked': false});
  }

  getMatCount() {
    matFalse = prefs.getInt('matFA');
    matTrue = prefs.getInt('matTR');
    matTotal = prefs.getInt('matTO');
    //prefs.setInt('counter', counter);
  }

  @override
  void initState() {
    super.initState();
    answered = false;
    if (matFalse == null) matFalse = 0;
    if (matTrue == null) matTrue = 0;
    if (matTotal == null) matTotal = 0;
    getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    void _showAnswer() {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(60),
                ),
                height: MediaQuery.of(context).size.width / 5,
                margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(answerText,
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                ),
              ),
            );
          });
    }

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
                //COUNTER
                child: Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.fromLTRB(15, 1, 15, 15), //LTRB
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 10,
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Icon(Icons.close, color: Colors.red, size: 30),
                            Text(
                              matFalse.toString(),
                              style: TextStyle(color: Colors.red, fontSize: 30),
                            ),
                          ])),
                      Expanded(
                          child: Text(matTotal.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30))),
                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            Text(
                              matTrue.toString(),
                              style:
                                  TextStyle(color: Colors.green, fontSize: 30),
                            ),
                            Icon(Icons.check, color: Colors.green, size: 30),
                          ])),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                //SORU
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Text(
                    questionText.replaceAll("**", "\n"),
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
                                color: aColor,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 180,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(1, 15, 15, 20), //LTRB
                              child: MaterialButton(
                                onPressed: () {
                                  answerControl = "Cevap: A";
                                  askControl();
                                },
                                child: Row(children: <Widget>[
                                  SizedBox(width: 3),
                                  Text("A) ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),
                                  Text(aText,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ]),
                              ),
                            ),
                            Container(
                              //C
                              decoration: BoxDecoration(
                                color: cColor,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 180,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(1, 20, 15, 1), //LTRB
                              child: MaterialButton(
                                onPressed: () {
                                  answerControl = "Cevap: C";
                                  askControl();
                                },
                                child: Row(children: <Widget>[
                                  SizedBox(width: 3),
                                  Text("C) ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),
                                  Text(cText,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ]),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              //B
                              decoration: BoxDecoration(
                                color: bColor,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 180,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(15, 15, 1, 20), //LTRB
                              child: MaterialButton(
                                onPressed: () {
                                  answerControl = "Cevap: B";
                                  askControl();
                                },
                                child: Row(children: <Widget>[
                                  SizedBox(width: 3),
                                  Text("B) ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),
                                  Text(bText,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ]),
                              ),
                            ),
                            Container(
                              //D
                              decoration: BoxDecoration(
                                color: dColor,
                                border:
                                    Border.all(width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 180,
                              height: 60,
                              margin: EdgeInsets.fromLTRB(15, 20, 1, 1), //LTRB
                              child: MaterialButton(
                                onPressed: () {
                                  answerControl = "Cevap: D";
                                  askControl();
                                },
                                child: Row(children: <Widget>[
                                  SizedBox(width: 3),
                                  Text("D) ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),
                                  Text(dText,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ]),
                              ),
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
                        child: MaterialButton(
                            onPressed: () {
                              wipeAsked();
                              _showAnswer();
                            },
                            child: Text("Cevabı Gör",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                                textAlign: TextAlign.center)),
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
