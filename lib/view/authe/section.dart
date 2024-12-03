import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/view/authe/loginscreen.dart';
import 'package:firebase_test/view/screens/homepage.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return Homepage();
        } else {
          return Loginscreen();
        }
      },
    );
  }
}
