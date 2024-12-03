import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/model/services/firebaseservices.dart';
import 'package:firebase_test/view/authe/loginscreen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
  final currentEmail=FirebaseAuth.instance.currentUser!;
  void siginOut(BuildContext context)async{
    await Firebaseservices().siginOut();
     Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Loginscreen(),
          ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [IconButton(onPressed: () {
          siginOut(context);
        }, icon: Icon(Icons.logout))],
      ),
      body: Center(
          child: Text('currentEmail.email.toString()')),
    );
  }
}
