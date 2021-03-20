import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
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
              backgroundColor: Colors.blue,
              expandedHeight: 250,
              title: Center(
                  child: Text(
                "T E S T L A B",
                style: TextStyle(fontSize: 40, color: Colors.white),
              )),
            ),
            SliverGrid.count(
              crossAxisCount: 1,
              childAspectRatio: 1 / 1.4,
              children: [
                Container(
                  color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.green,
                        width: 200,
                        height: 60,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(20)),
                            Center(
                                child: Text(
                              "Giris Yap",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            )),
                            MaterialButton(onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: 200,
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(20)),
                            Center(
                                child: Text(
                              "Kullanıcı Adı",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            MaterialButton(onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: 200,
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(20)),
                            Center(
                                child: Text(
                              "Sifre",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            MaterialButton(onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: 90,
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(20)),
                            Center(
                                child: Text(
                              "Giris",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            MaterialButton(onPressed: () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.green,
                        width: 200,
                        height: 60,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(20)),
                            Center(
                                child: Text(
                              "Giris Yap",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            )),
                            MaterialButton(onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: 90,
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(20)),
                            Center(
                                child: Text(
                              "Kullanıcı Adı",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            MaterialButton(onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: 90,
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(20)),
                            Center(
                                child: Text(
                              "Sifre",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            MaterialButton(onPressed: () {}),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: 90,
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(20)),
                            Center(
                                child: Text(
                              "Giris",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            MaterialButton(onPressed: () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      color: Colors.blue[100 * (index % 9 + 1)],
                      height: 250,
                      alignment: Alignment.center,
                      child: Text(
                        "Item $index",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
