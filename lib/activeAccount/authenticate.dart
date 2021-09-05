import 'package:chat_app/HomePage.dart';
import 'package:chat_app/activeAccount/aMain.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser != null){
      return aMain();
    }
    else {
      return HomePage();
    }

  }
}
