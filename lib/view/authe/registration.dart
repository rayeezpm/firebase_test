import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/model/services/firebaseservices.dart';
import 'package:firebase_test/uitils/Widgets/textfield1.dart';
import 'package:firebase_test/view/authe/loginscreen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void signin(BuildContext context) async {
    try {
      await Firebaseservices()
          .signup(emailcontroller.text, passwordcontroller.text);
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Loginscreen(),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration successfull')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Signin error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                SizedBox(
                  height: 20,
                ),
                Textfield1(controller: emailcontroller, text: 'Email'),
                SizedBox(
                  height: 10,
                ),
                Textfield1(controller: passwordcontroller, text: 'Password'),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      signin(context);
                    },
                    child: Text('Submit')),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginscreen(),
                          ));
                    },
                    child: Text('Sign In'))
              ],
            );
          }),
    );
  }
}
