import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testlab/screens/authenticate/authenticate.dart';
import 'package:testlab/models/user.dart';
import 'package:testlab/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);

    //Giriş? home/authenticate
    if (user == null)
      return Authenticate();
    else
      return Home();
  }
}
