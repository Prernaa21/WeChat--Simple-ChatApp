import 'package:chat_app/activeAccount/aMain.dart';
import 'package:chat_app/activeAccount/signUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Methods.dart';

class aHome extends StatefulWidget {
  @override
  _aHomeState createState() => _aHomeState();
}

class _aHomeState extends State<aHome> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading ?
      Center(
    child: Container(
      child: CircularProgressIndicator(),
    padding: EdgeInsets.only(bottom: 0),
    )) : SingleChildScrollView(
    child: Column(
    children: <Widget>[
    Container(
    margin: EdgeInsets.only(top: 100),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text(
    "WeTap",
    style: GoogleFonts.indieFlower(
    color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 35),
    ) ,
    ],
    ),
    ),
    Container(
    margin: EdgeInsets.only(top: 80,),
    child: Text("Login Now!",
    style: GoogleFonts.poppins(color: Colors.lightBlue, fontWeight: FontWeight.w600, fontSize: 25)

    ),),

    Container(
    padding: EdgeInsets.all(35),
    margin: EdgeInsets.only(top: 40),
    child: TextField(
    cursorColor: Colors.black,
    controller: _emailController,
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.email_outlined),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlue),
    borderRadius: new BorderRadius.circular(15.0),
    ),
    labelText: "Email",
    hintText: "Enter Email Here",
    ),
    keyboardType: TextInputType.emailAddress,
    )),

    Container(
    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
    child: TextField(
    cursorColor: Colors.black,
    controller: _passwordController,
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.lock_rounded),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlue),
    borderRadius: new BorderRadius.circular(15.0),
    ),
    labelText: "Password",
    hintText: "Enter Password Here",
    ),
    obscureText: true,
    )),


    InkWell(
    onTap: () {
      if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        setState(() {
          isLoading = true;
        });
        logIn(_emailController.text,_passwordController.text).then((user){
          if(user !=null){
            print("login success");
            setState(() {
              isLoading=false;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
            aMain()));
          }
          else{
            print("login failed");
            setState(() {
              isLoading = false;
            });
          }
        });
      }
      else{
        print("fill form correctly");
      }

    },
    child: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Colors.black,
    Colors.black
    ]
    ),
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
    color: Colors.black,
    width: 1,
    )),
    width: MediaQuery
        .of(context)
        .size
        .width,
    margin: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Center(child: Text(
    "Login", style: TextStyle(color: Colors.white),)),
    ),
    ),
    TextButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailPassSignup()));
    },
    child: Text("Don't Have an Account? Sign-Up Now!",  style: TextStyle(
    color: Colors.black
    ),),),
    ],),
    ),
    );
  }

  }
