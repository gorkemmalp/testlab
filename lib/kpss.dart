import 'package:flutter/material.dart';

class KpssView extends StatefulWidget {
  @override
  _KpssViewState createState() => _KpssViewState();
}

class _KpssViewState extends State<KpssView> {
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 200,
              floating: true,
              title: Center(
                  child: Text(
                "K P S S",
                style: TextStyle(fontSize: 40, color: Colors.white),
              )),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(crossAxisCount: 2, children: [
                  Center(
                    child: Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Center(
                    child: Container(
                      color: Colors.green,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ]),
                /*child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.only(bottom: 35),
                    child: MaterialButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/kpss');
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
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: MaterialButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/tyt');
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
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: MaterialButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/ayt');
                      },
                      child: Stack(
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/2_AYT.png"),
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                ]),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
//import 'package:testlab/main.dart';

class KpssView extends StatefulWidget {
  @override
  _KpssViewState createState() => _KpssViewState();
}

class _KpssViewState extends State<KpssView> {
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 200,
              floating: true,
              title: Center(
                  child: Text(
                "K P S S",
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
                          height: 432,
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
                              SizedBox(height: 20),
                              Container(
                                height: 80.0,
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
                          height: 88,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(25)),
                            margin:
                                EdgeInsets.fromLTRB(25, 20, 25, 20), //L,T,R,B
                            child: FlatButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 6),
                                      alignment: Alignment.center,
                                      child: Text("G",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40)),
                                    ),
                                    SizedBox(width: 30),
                                    Container(
                                      margin: EdgeInsets.only(right: 6),
                                      child: Text("Google İle Giriş Yap",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                          textAlign: TextAlign.center),
                                    )
                                  ],
                                )),
                          ),
                        )
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
*/
