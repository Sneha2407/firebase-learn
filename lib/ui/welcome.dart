import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome User"),
        actions: [
          IconButton(
              onPressed: () async {
                _auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginscreen()));
                });
                await _googleSignIn.disconnect();
              },
              icon: Icon(Icons.logout))
        ],
        
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: Image.network((FirebaseAuth.instance.currentUser!.photoURL)!=null?(FirebaseAuth.instance.currentUser!.photoURL!):'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWegYI3Vf0R06HyfhbHVI0tJR6XSzk_RymCsm3yxJtrI67GHa2JGcskCsUsoaf_DmEDy4&usqp=CAU'),height: 100, width: 100,),
            Text((FirebaseAuth.instance.currentUser!.email)!=null?(FirebaseAuth.instance.currentUser!.email!):"No Data",
            style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 20),),
             Text((FirebaseAuth.instance.currentUser!.displayName)!=null?(FirebaseAuth.instance.currentUser!.displayName!):"No name",
            style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 20),),
            
          ],
        ),
      ),
    );
  }
}
