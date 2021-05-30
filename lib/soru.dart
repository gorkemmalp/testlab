import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testlab/screens/home/home.dart';
import 'dart:math';

String lessonPick = "";

class SoruView extends StatefulWidget {
  @override
  _SoruViewState createState() => _SoruViewState();
}

class _SoruViewState extends State<SoruView> {
  var questionText = "",
      aText = "",
      bText = "",
      cText = "",
      dText = "",
      answerText = "";
  bool asked = false, answered = false;
  int questionNumber;
  double answerWidth = 150, answerHeight = 50;
  double nextWidth = 0, nextHeight = 0;
  String answerControl = "";

  String trueText = "0", falseText = "0", totalText = "0";
  int matTrue = 0, matFalse = 0, matTotal = 0;
  int turkTrue = 0, turkFalse = 0, turkTotal = 0;
  int tarihTrue = 0, tarihFalse = 0, tarihTotal = 0;
  int guncelTrue = 0, guncelFalse = 0, guncelTotal = 0;
  int vatanTrue = 0, vatanFalse = 0, vatanTotal = 0;
  int biyoTrue = 0, biyoFalse = 0, biyoTotal = 0;
  int cogrTrue = 0, cogrFalse = 0, cogrTotal = 0;
  int felsTrue = 0, felsFalse = 0, felsTotal = 0;
  int fizikTrue = 0, fizikFalse = 0, fizikTotal = 0;
  int kimyaTrue = 0, kimyaFalse = 0, kimyaTotal = 0;
  int edebTrue = 0, edebFalse = 0, edebTotal = 0;
  int dinTrue = 0, dinFalse = 0, dinTotal = 0;

  void setCount(int _true, int _false, int _total) async {
    final prefs = await SharedPreferences.getInstance();

    if (lessonPick == "matematik") {
      prefs.setInt("MATTRUE", _true);
      prefs.setInt("MATFALSE", _false);
      prefs.setInt("MATTOTAL", _total);
    } else if (lessonPick == "turkce") {
      prefs.setInt("TURKTRUE", _true);
      prefs.setInt("TURKFALSE", _false);
      prefs.setInt("TURKTOTAL", _total);
    } else if (lessonPick == "tarih") {
      prefs.setInt("TARIHTRUE", _true);
      prefs.setInt("TARIHFALSE", _false);
      prefs.setInt("TARIHTOTAL", _total);
    } else if (lessonPick == "guncel") {
      prefs.setInt("GUNCELTRUE", _true);
      prefs.setInt("GUNCELFALSE", _false);
      prefs.setInt("GUNCELTOTAL", _total);
    } else if (lessonPick == "vatandaslik") {
      prefs.setInt("VATANTRUE", _true);
      prefs.setInt("VATANFALSE", _false);
      prefs.setInt("VATANTOTAL", _total);
    } else if (lessonPick == "biyoloji") {
      prefs.setInt("BIYOTRUE", _true);
      prefs.setInt("BIYOFALSE", _false);
      prefs.setInt("BIYOTOTAL", _total);
    } else if (lessonPick == "cografya") {
      prefs.setInt("COGRTRUE", _true);
      prefs.setInt("COGRFALSE", _false);
      prefs.setInt("COGRTOTAL", _total);
    } else if (lessonPick == "felsefe") {
      prefs.setInt("FELSTRUE", _true);
      prefs.setInt("FELSFALSE", _false);
      prefs.setInt("FELSTOTAL", _total);
    } else if (lessonPick == "fizik") {
      prefs.setInt("FIZIKTRUE", _true);
      prefs.setInt("FIZIKFALSE", _false);
      prefs.setInt("FIZIKTOTAL", _total);
    } else if (lessonPick == "kimya") {
      prefs.setInt("KIMYATRUE", _true);
      prefs.setInt("KIMYAFALSE", _false);
      prefs.setInt("KIMYATOTAL", _total);
    } else if (lessonPick == "edebiyat") {
      prefs.setInt("EDEBTRUE", _true);
      prefs.setInt("EDEBFALSE", _false);
      prefs.setInt("EDEBTOTAL", _total);
    } else if (lessonPick == "din") {
      prefs.setInt("DINTRUE", _true);
      prefs.setInt("DINFALSE", _false);
      prefs.setInt("DINTOTAL", _total);
    }
    getCount();
  }

  void getCount() async {
    final prefs = await SharedPreferences.getInstance();

    if (lessonPick == "matematik") {
      int setTrue = prefs.getInt("MATTRUE");
      int setFalse = prefs.getInt("MATFALSE");
      int setTotal = prefs.getInt("MATTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        matTrue = setTrue;
        matFalse = setFalse;
        matTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "turkce") {
      int setTrue = prefs.getInt("TURKTRUE");
      int setFalse = prefs.getInt("TURKFALSE");
      int setTotal = prefs.getInt("TURKTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        turkTrue = setTrue;
        turkFalse = setFalse;
        turkTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "tarih") {
      int setTrue = prefs.getInt("TARIHTRUE");
      int setFalse = prefs.getInt("TARIHFALSE");
      int setTotal = prefs.getInt("TARIHTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        tarihTrue = setTrue;
        tarihFalse = setFalse;
        tarihTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "guncel") {
      int setTrue = prefs.getInt("GUNCELTRUE");
      int setFalse = prefs.getInt("GUNCELFALSE");
      int setTotal = prefs.getInt("GUNCELTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        guncelTrue = setTrue;
        guncelFalse = setFalse;
        guncelTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "vatandaslik") {
      int setTrue = prefs.getInt("VATANTRUE");
      int setFalse = prefs.getInt("VATANFALSE");
      int setTotal = prefs.getInt("VATANTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        vatanTrue = setTrue;
        vatanFalse = setFalse;
        vatanTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "biyoloji") {
      int setTrue = prefs.getInt("BIYOTRUE");
      int setFalse = prefs.getInt("BIYOFALSE");
      int setTotal = prefs.getInt("BIYOTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        biyoTrue = setTrue;
        biyoFalse = setFalse;
        biyoTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "cografya") {
      int setTrue = prefs.getInt("COGRTRUE");
      int setFalse = prefs.getInt("COGRFALSE");
      int setTotal = prefs.getInt("COGRTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        cogrTrue = setTrue;
        cogrFalse = setFalse;
        cogrTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "felsefe") {
      int setTrue = prefs.getInt("FELSTRUE");
      int setFalse = prefs.getInt("FELSFALSE");
      int setTotal = prefs.getInt("FELSTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        felsTrue = setTrue;
        felsFalse = setFalse;
        felsTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "fizik") {
      int setTrue = prefs.getInt("FIZIKTRUE");
      int setFalse = prefs.getInt("FIZIKFALSE");
      int setTotal = prefs.getInt("FIZIKTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        fizikTrue = setTrue;
        fizikFalse = setFalse;
        fizikTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "kimya") {
      int setTrue = prefs.getInt("KIMYATRUE");
      int setFalse = prefs.getInt("KIMYAFALSE");
      int setTotal = prefs.getInt("KIMYATOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        kimyaTrue = setTrue;
        kimyaFalse = setFalse;
        kimyaTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "edebiyat") {
      int setTrue = prefs.getInt("EDEBTRUE");
      int setFalse = prefs.getInt("EDEBFALSE");
      int setTotal = prefs.getInt("EDEBTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        edebTrue = setTrue;
        edebFalse = setFalse;
        edebTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    } else if (lessonPick == "din") {
      int setTrue = prefs.getInt("DINTRUE");
      int setFalse = prefs.getInt("DINFALSE");
      int setTotal = prefs.getInt("DINTOTAL");

      if (setTrue == null) setTrue = 0;
      if (setFalse == null) setFalse = 0;
      if (setTotal == null) setTotal = 0;

      setState(() {
        dinTrue = setTrue;
        dinFalse = setFalse;
        dinTotal = setTotal;
        trueText = setTrue.toString();
        falseText = setFalse.toString();
        totalText = setTotal.toString();
      });
    }
  }

  Color aColor = Colors.transparent,
      bColor = Colors.transparent,
      cColor = Colors.transparent,
      dColor = Colors.transparent;

  String pickAQuestion() {
    Random random = new Random();
    questionNumber = random.nextInt(13);
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
          getCount();
          if (lessonPick == "matematik") {
            matTotal++;
            setCount(matTrue, matFalse, matTotal);
          } else if (lessonPick == "turkce") {
            turkTotal++;
            setCount(turkTrue, turkFalse, turkTotal);
          } else if (lessonPick == "tarih") {
            tarihTotal++;
            setCount(tarihTrue, tarihFalse, tarihTotal);
          } else if (lessonPick == "guncel") {
            guncelTotal++;
            setCount(guncelTrue, guncelFalse, guncelTotal);
          } else if (lessonPick == "vatandaslik") {
            vatanTotal++;
            setCount(vatanTrue, vatanFalse, vatanTotal);
          } else if (lessonPick == "biyoloji") {
            biyoTotal++;
            setCount(biyoTrue, biyoFalse, biyoTotal);
          } else if (lessonPick == "cografya") {
            cogrTotal++;
            setCount(cogrTrue, cogrFalse, cogrTotal);
          } else if (lessonPick == "felsefe") {
            felsTotal++;
            setCount(felsTrue, felsFalse, felsTotal);
          } else if (lessonPick == "fizik") {
            fizikTotal++;
            setCount(fizikTrue, fizikFalse, fizikTotal);
          } else if (lessonPick == "kimya") {
            kimyaTotal++;
            setCount(kimyaTrue, kimyaFalse, kimyaTotal);
          } else if (lessonPick == "edebiyat") {
            edebTotal++;
            setCount(edebTrue, edebFalse, edebTotal);
          } else if (lessonPick == "din") {
            dinTotal++;
            setCount(dinTrue, dinFalse, dinTotal);
          }
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

  showCongrats() {
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
                          style: TextStyle(color: Colors.white, fontSize: 40)),
                      SizedBox(width: 5),
                      Icon(Icons.check, color: Colors.white, size: 50),
                    ]),
              ),
            ),
          );
        });
  }

  askControl() {
    if (answerControl == answerText) {
      //Doğru
      rightAnswer();
    } else {
      //Yanlış
      wrongAnswer();
    }
  }

  rightAnswer() {
    if (!answered) {
      getCount();
      if (lessonPick == "matematik") {
        matTrue++;
        setCount(matTrue, matFalse, matTotal);
      } else if (lessonPick == "turkce") {
        turkTrue++;
        setCount(turkTrue, turkFalse, turkTotal);
      } else if (lessonPick == "tarih") {
        tarihTrue++;
        setCount(tarihTrue, tarihFalse, tarihTotal);
      } else if (lessonPick == "guncel") {
        guncelTrue++;
        setCount(guncelTrue, guncelFalse, guncelTotal);
      } else if (lessonPick == "vatandaslik") {
        vatanTrue++;
        setCount(vatanTrue, vatanFalse, vatanTotal);
      } else if (lessonPick == "biyoloji") {
        biyoTrue++;
        setCount(biyoTrue, biyoFalse, biyoTotal);
      } else if (lessonPick == "cografya") {
        cogrTrue++;
        setCount(cogrTrue, cogrFalse, cogrTotal);
      } else if (lessonPick == "felsefe") {
        felsTrue++;
        setCount(felsTrue, felsFalse, felsTotal);
      } else if (lessonPick == "fizik") {
        fizikTrue++;
        setCount(fizikTrue, fizikFalse, fizikTotal);
      } else if (lessonPick == "kimya") {
        kimyaTrue++;
        setCount(kimyaTrue, kimyaFalse, kimyaTotal);
      } else if (lessonPick == "edebiyat") {
        edebTrue++;
        setCount(edebTrue, edebFalse, edebTotal);
      } else if (lessonPick == "din") {
        dinTrue++;
        setCount(dinTrue, dinFalse, dinTotal);
      }
      answered = true;
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
    showCongrats();
    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new SoruView(),
        ),
      );
    });
  }

  wrongAnswer() {
    if (!answered) {
      getCount();
      if (lessonPick == "matematik") {
        matFalse++;
        setCount(matTrue, matFalse, matTotal);
      } else if (lessonPick == "turkce") {
        turkFalse++;
        setCount(turkTrue, turkFalse, turkTotal);
      } else if (lessonPick == "tarih") {
        tarihFalse++;
        setCount(tarihTrue, tarihFalse, tarihTotal);
      } else if (lessonPick == "guncel") {
        guncelFalse++;
        setCount(guncelTrue, guncelFalse, guncelTotal);
      } else if (lessonPick == "vatandaslik") {
        vatanFalse++;
        setCount(vatanTrue, vatanFalse, vatanTotal);
      } else if (lessonPick == "biyoloji") {
        biyoFalse++;
        setCount(biyoTrue, biyoFalse, biyoTotal);
      } else if (lessonPick == "cografya") {
        cogrFalse++;
        setCount(cogrTrue, cogrFalse, cogrTotal);
      } else if (lessonPick == "felsefe") {
        felsFalse++;
        setCount(felsTrue, felsFalse, felsTotal);
      } else if (lessonPick == "fizik") {
        fizikFalse++;
        setCount(fizikTrue, fizikFalse, fizikTotal);
      } else if (lessonPick == "kimya") {
        kimyaFalse++;
        setCount(kimyaTrue, kimyaFalse, kimyaTotal);
      } else if (lessonPick == "edebiyat") {
        edebFalse++;
        setCount(edebTrue, edebFalse, edebTotal);
      } else if (lessonPick == "din") {
        dinFalse++;
        setCount(dinTrue, dinFalse, dinTotal);
      }
      setState(() {
        answerHeight = 0;
        answerWidth = 0;
        nextHeight = 50;
        nextWidth = 190;
      });
      answered = true;
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
    if (answerText == "Cevap: A")
      setState(() {
        aColor = Colors.green;
      });
    else if (answerText == "Cevap: B")
      setState(() {
        bColor = Colors.green;
      });
    else if (answerText == "Cevap: C")
      setState(() {
        cColor = Colors.green;
      });
    else if (answerText == "Cevap: D")
      setState(() {
        dColor = Colors.green;
      });
  }

  @override
  void initState() {
    super.initState();
    answered = false;
    answerHeight = 50;
    answerWidth = 150;
    nextHeight = 0;
    nextWidth = 0;
    getCount();
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
      setState(() {
        answerHeight = 0;
        answerWidth = 0;
        nextHeight = 50;
        nextWidth = 190;
      });
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
      if (answerText == "Cevap: A")
        setState(() {
          aColor = Colors.green;
        });
      else if (answerText == "Cevap: B")
        setState(() {
          bColor = Colors.green;
        });
      else if (answerText == "Cevap: C")
        setState(() {
          cColor = Colors.green;
        });
      else if (answerText == "Cevap: D")
        setState(() {
          dColor = Colors.green;
        });
    }

    return new WillPopScope(
      onWillPop: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new Home(),
          ),
        );
        return null;
      },
      child: MaterialApp(
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
                                falseText,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 30),
                              ),
                            ])),
                        Expanded(
                            child: Text(totalText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30))),
                        Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                              Text(
                                trueText,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 30),
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
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //A
                          decoration: BoxDecoration(
                            color: aColor,
                            border: Border.all(width: 1.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(10, 40, 10, 30), //LTRB
                          child: MaterialButton(
                            onPressed: () {
                              answerControl = "Cevap: A";
                              askControl();
                            },
                            child: Row(children: <Widget>[
                              SizedBox(width: 1),
                              Text("A) ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                              Expanded(
                                child: Text(aText,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.left),
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          //B
                          decoration: BoxDecoration(
                            color: bColor,
                            border: Border.all(width: 1.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(10, 3, 10, 30), //LTRB
                          child: MaterialButton(
                            onPressed: () {
                              answerControl = "Cevap: B";
                              askControl();
                            },
                            child: Row(children: <Widget>[
                              SizedBox(width: 1),
                              Text("B) ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                              Expanded(
                                child: Text(bText,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          //C
                          decoration: BoxDecoration(
                            color: cColor,
                            border: Border.all(width: 1.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(10, 3, 10, 30), //LTRB
                          child: MaterialButton(
                            onPressed: () {
                              answerControl = "Cevap: C";
                              askControl();
                            },
                            child: Row(children: <Widget>[
                              SizedBox(width: 1),
                              Text("C) ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                              Expanded(
                                child: Text(cText,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          //D
                          decoration: BoxDecoration(
                            color: dColor,
                            border: Border.all(width: 1.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(10, 3, 10, 30), //LTRB
                          child: MaterialButton(
                            onPressed: () {
                              answerControl = "Cevap: D";
                              askControl();
                            },
                            child: Row(children: <Widget>[
                              SizedBox(width: 1),
                              Text("D) ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                              Expanded(
                                child: Text(dText,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 7.8,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: answerWidth,
                              height: answerHeight,
                              child: Center(
                                child: MaterialButton(
                                    onPressed: () {
                                      //wipeAsked();
                                      _showAnswer();
                                      answered = true;
                                    },
                                    child: Text("Cevabı Gör",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                        textAlign: TextAlign.center)),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: nextWidth,
                              height: nextHeight,
                              child: Center(
                                child: MaterialButton(
                                    onPressed: () {
                                      answered = true;
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (context) => new SoruView(),
                                        ),
                                      );
                                    },
                                    child: Row(children: [
                                      Text("Sonraki Soru ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19),
                                          textAlign: TextAlign.center),
                                      Icon(Icons.arrow_right_alt,
                                          size: 30, color: Colors.white),
                                    ])),
                              )),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
