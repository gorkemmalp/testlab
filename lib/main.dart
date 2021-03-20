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
  bool selected = true;
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
              expandedHeight: 180,
              floating: true,
              title: Center(
                  child: Text(
                "T E S T L A B",
                style: TextStyle(fontSize: 40, color: Colors.white),
              )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image: AssetImage("assets/1_background.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 550,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 15),
                                height: 302,
                                child: Text(
                                  "Giriş Yap\n\nTest Çözmeye\n\nBaşla!",
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        Shadow(
                                          offset: Offset(10.0, 10.0),
                                          blurRadius: 8.0,
                                          color: Color.fromARGB(125, 0, 0, 255),
                                        ),
                                      ]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                height: 175.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/1_drop_down_arrow.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          height: 890,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(height: 100),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                margin: EdgeInsets.all(40),
                                child: Text("GİRİŞ YAP",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60),
                                    textAlign: TextAlign.center),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                margin: EdgeInsets.fromLTRB(
                                    30, 20, 30, 20), //L,T,R,B
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '    Kullanıcı Adı',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 25)),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '    Şifre',
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 25)),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.width / 6,
                                margin: EdgeInsets.all(40), //L,T,R,B
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10), //L,T,R,B
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: MaterialButton(
                                        onPressed: null,
                                        child: Text("GOOGLE",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10), //L,T,R,B
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: MaterialButton(
                                        onPressed: null,
                                        child: Text("GİRİŞ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
