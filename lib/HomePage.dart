import 'package:flutter/material.dart';
import 'activeAccount/aHome.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("android/app/src/main/res/drawable/abc.png"),
    fit: BoxFit.cover,
    ),),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 300
              ),
              child: Text(
              "WeTap",
              style: GoogleFonts.indieFlower(color: Colors.black, fontSize: 50),
          ),
            ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 170, height: 50),
            child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.white)
        )
      )
    ),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>aHome()),);
            },
            child: Text('Chat Now!'
            ,
            style:  TextStyle(color: Colors.white),),
      ),
          )),
          ]),
        ),
      ),
    );
  }
}
