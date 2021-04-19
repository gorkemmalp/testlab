import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testlab/soru.dart';

class KpssView extends StatefulWidget {
  @override
  _KpssViewState createState() => _KpssViewState();
}

class _KpssViewState extends State<KpssView> {
  void soruAc() {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new SoruView(),
      ),
    );
  }

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
                expandedHeight: 230,
                floating: false,
                title: Center(
                    child: Text(
                  "K P S S",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.0),
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: 180,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, color: Colors.white),
                          SizedBox(width: 6),
                          Text("Ana Sayfa",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                  ),
                ),
              ),
              SliverGrid.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 60,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        lessonPick = "matematik";
                        soruAc();
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Matematik.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        lessonPick = "turkce";
                        soruAc();
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Turkce.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        lessonPick = "geometri";
                        soruAc();
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Geometri.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        lessonPick = "vatandaslik";
                        soruAc();
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image:
                                  AssetImage("assets/Lessons/Vatandaslik.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        lessonPick = "cografya";
                        soruAc();
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Cografya.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        lessonPick = "tarih";
                        soruAc();
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Tarih.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        lessonPick = "guncel";
                        soruAc();
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage(
                                  "assets/Lessons/Guncel_Bilgiler.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
