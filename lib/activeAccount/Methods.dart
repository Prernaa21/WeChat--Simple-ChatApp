import 'package:chat_app/activeAccount/aHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<User> signUp(String name, String email, String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try{
    User user = (await _auth.createUserWithEmailAndPassword(email: email, password: password))
        .user;

    if(user != null){
      print("Account created successfully");

      user.updateProfile(displayName: name);

      await _firestore.collection('users').doc(_auth.currentUser.uid).set({
        "name": name,
        "email": email,
        "status": "Unavailable",
      });
      return user;
    }
    else {
      print("error failed");
      return user;
    }
  }
  catch (e) {
    print(e);
    return null;
  }
}

Future<User> logIn(String email, String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  try{
    User user =(await _auth.signInWithEmailAndPassword(email: email, password: password))
        .user;
    if(user!=null){
      print("success login");
      return user;
    }
    else{
      print("login failed");
    }
  }
  catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut().then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>aHome()));
    });
  }
  catch(e) {
    print("error");
  }
}

