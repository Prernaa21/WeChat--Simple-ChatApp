import 'package:chat_app/activeAccount/ChatRoom.dart';
import 'package:chat_app/activeAccount/aHome.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class aMain extends StatefulWidget {
  @override
  _aMainState createState() => _aMainState();
}

class _aMainState extends State<aMain> {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  final TextEditingController _searchController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
  await _firestore
      .collection('users')
      .where("email", isEqualTo: _searchController.text)
      .get()
      .then((value) {
  setState(() {
  userMap = value.docs[0].data();
  isLoading = false;
  });
  print(userMap);
  });
}

@override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("ChatRoom"),
      ),
      body: isLoading
          ? Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            height: size.height / 14,
            width: size.width,
            alignment: Alignment.center,
            child: Container(
              height: size.height / 14,
              width: size.width / 1.15,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                  hintText: "Search User",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 50,
          ),
          ElevatedButton(
            onPressed: onSearch,
            child: Text("Search"),
          ),
          SizedBox(
            height: size.height/30,
          ),
          userMap != null? ListTile(
            onTap: (){
              String roomId = chatRoomId(
                  _auth.currentUser.displayName,
                  userMap['name']);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatRoom(
                    chatRoomId: roomId,
                    userMap: userMap,
                  ),
                ),
              );
            },
            leading:  Icon(Icons.account_circle_sharp, size: 35, color: Colors.black,),
            title: Text(
              userMap['name'],
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),
            ),
            subtitle: Text(userMap['email']),
            trailing: Icon(Icons.chat_bubble_outline_sharp, size: 35, color: Colors.black,),
          )
              :Container()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
          aHome()));
        },
        child: const Icon(Icons.logout),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
