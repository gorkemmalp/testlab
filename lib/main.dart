import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testlab/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:testlab/services/auth.dart';
import 'package:testlab/models/user.dart';
import 'package:testlab/screens/authenticate/authenticate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    routes: {
      "/": (context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);

    //Giriş? home/authenticate
    if (user == null) {
      return Authenticate();
    } else
      return Home();
  }
}
