import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TytView extends StatefulWidget {
  @override
  _TytViewState createState() => _TytViewState();
}

class _TytViewState extends State<TytView> {
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
                  "T Y T",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
              ),
              SliverGrid.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 60,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/soru');
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
                        Navigator.pushNamed(context, '/soru');
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
                        Navigator.pushNamed(context, '/soru');
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Fizik.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/soru');
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
                        Navigator.pushNamed(context, '/soru');
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Kimya.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/soru');
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
                        Navigator.pushNamed(context, '/soru');
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Biyoloji.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/soru');
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Felsefe.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/soru');
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/Lessons/Din.png"),
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
