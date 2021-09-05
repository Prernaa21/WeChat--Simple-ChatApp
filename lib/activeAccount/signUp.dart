import 'package:chat_app/activeAccount/Methods.dart';
import 'package:flutter/material.dart';
import 'Methods.dart';
import 'package:google_fonts/google_fonts.dart';


class EmailPassSignup extends StatefulWidget {
  @override
  _EmailPassSignupState createState() => _EmailPassSignupState();
}

class _EmailPassSignupState extends State<EmailPassSignup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading ?
      Center(
        child: Container(
          height: size.height / 20,
            width: size.height /20,
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
                margin: EdgeInsets.only(top: 40,),
                child: Text("Create Account!",
                    style: GoogleFonts.poppins(color: Colors.lightBlue, fontWeight: FontWeight.w600, fontSize: 25)

                ),),

              Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                  top: 80,
                   left: 35,
                    right: 35,
                bottom: 15),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    labelText: "Name",
                    hintText: "Enter Name Here",
                  ),
                  keyboardType: TextInputType.name,
                )),
            Container(
                padding: EdgeInsets.all(35),
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
                if(_nameController.text.isNotEmpty &&
                _emailController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty){
                setState(() {
                  isLoading = true;
                });
                signUp(_nameController.text, _emailController.text, _passwordController.text)
                .then((user){
                  if (user != null){
                    setState(() {
                      isLoading = false;
                    });
                    print("login success");
                  }
                  else{
                    print("login failed");
                    setState(() {
                      isLoading=false;
                    });
                  }
                });
                }
                else{
                  print("please enter fields");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient:
                    LinearGradient(colors: [Colors.black, Colors.black]),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(
                    child: Text(
                      "Sign-up!",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    ])));}}