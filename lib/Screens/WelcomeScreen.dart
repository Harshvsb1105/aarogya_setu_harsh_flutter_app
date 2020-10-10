import 'package:aarogya_setu_harsh_flutter_app/Screens/AppPermissionsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SelectLanguage.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String uid = "";

  @override
  void initState() {
    uid = "";
    final val = FirebaseAuth.instance.currentUser;
    setState(() {
    this.uid = val.uid;
    });
    super.initState();
  }

  Future<void> _logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=> AppPermissionPage()),);
    } catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9e9e9),
      appBar: AppBar(
        backgroundColor: Color(0xfff9e9e9),
        elevation: 0,
        title: Center(
          child: Text('Welcome', style: TextStyle(color: Color(0xFF232b2b)),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.g_translate),
              color: Color(0xFF232b2b),
              iconSize: 25.0,
              onPressed: (){
                return Navigator.push(context, MaterialPageRoute(builder: (_) => SelectLanguage()));
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome, You have successfully logged in"
              ),
            ),
            OutlineButton(
                borderSide: BorderSide(
                  color: Color(0xff303030),
                  style: BorderStyle.solid,
                  width: 3,

                ),
                child: Text("Log out", style: TextStyle(
                  color: Color(0xff303030),),
                ),
                onPressed:(){
                  _logout();
                }
            )
          ],
        ),
      ),
    );
  }
}
