import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;
  bool isUserSignedIn = false;
  @override
  void initState() {
    super.initState();
    initApp();
    onGoogleSignIn(context);
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(
        app: defaultApp); // immediately check whether the user is signed in
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();
    setState(() {
      isUserSignedIn = userSignedIn;
    });
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
                                onPressed: () {
                                  onGoogleSignIn(context);
                                },
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

  Future<User> _handleSignIn() async {
    User user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    User user = await _handleSignIn();
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WelcomeUserWidget(user, _googleSignIn)),
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }
}

class WelcomeUserWidget extends StatelessWidget {
  GoogleSignIn _googleSignIn;
  User _user;

  @override
  WelcomeUserWidget(User user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
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
            expandedHeight: 180,
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
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 7,
                        margin: EdgeInsets.only(bottom: 10), //L,T,R,B
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(_user.photoURL,
                                    width: 40, height: 40, fit: BoxFit.cover)),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                                _googleSignIn.signOut();
                              },
                              child: Text("Çıkış Yap",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      decoration: TextDecoration.underline,
                                      color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        height: 1100,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
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
                                        image: AssetImage("assets/2_KPSS.png"),
                                        fit: BoxFit.contain),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "KPSS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 50),
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
                                              color: Colors.black,
                                              fontSize: 50),
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
                                              color: Colors.black,
                                              fontSize: 50),
                                          textAlign: TextAlign.center,
                                        )),
                                  ],
                                ),
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
        ]),
      ),
    );
  }
}
