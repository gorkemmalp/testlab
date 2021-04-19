import 'package:flutter/material.dart';
import 'package:testlab/services/auth.dart';
import 'package:testlab/shared/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
            theme: ThemeData(fontFamily: 'Century'),
            home: Scaffold(
              backgroundColor: Colors.black,
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.black,
                    expandedHeight: 150,
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
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/1_background.jpg"),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                height: 470,
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
                                        "Oturum Aç\n\nTest Çözmeye\n\nBaşla!",
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(1.0, 1.0),
                                                blurRadius: 3.0,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              Shadow(
                                                offset: Offset(10.0, 10.0),
                                                blurRadius: 8.0,
                                                color: Color.fromARGB(
                                                    125, 0, 0, 255),
                                              ),
                                            ]),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      height:
                                          MediaQuery.of(context).size.width / 3,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/1_drop_down.gif"),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                color: Colors.black,
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent[400],
                                      borderRadius: BorderRadius.circular(30)),
                                  margin: EdgeInsets.fromLTRB(
                                      60, 10, 60, 10), //L,T,R,B
                                  child: MaterialButton(
                                    onPressed: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      dynamic result = await _auth.signInAnon();
                                      if (result == null) {
                                        setState(() {
                                          loading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: "Bir Hata Oluştu!");
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Oturum Başarıyla Açıldı!");
                                        print(result.uid);
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.person,
                                            color: Colors.white, size: 35),
                                        SizedBox(width: 10),
                                        Text("Oturum Aç",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 34),
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
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


/*

Container(
                                      height:
                                          MediaQuery.of(context).size.width / 4,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/1_drop_down_arrow.png"),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),

*/




/*Giriş Yap onPressed()
onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null)
                print("Sign in error");
              else {
                print("Sign in succesfully");
                print(result.uid);
              }
            },
*/



/*

Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to TESTLAB"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: MaterialButton(
          color: Colors.orangeAccent,
          child: Text("Sign in"),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null)
              print("Sign in error");
            else {
              print("Sign in succesfully");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }

*/