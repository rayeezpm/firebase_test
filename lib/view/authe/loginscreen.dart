import 'package:firebase_test/model/services/firebaseservices.dart';
import 'package:firebase_test/uitils/Widgets/textfield1.dart';
import 'package:firebase_test/view/authe/registration.dart';
import 'package:firebase_test/view/screens/homepage.dart';
import 'package:flutter/material.dart';


class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ValueNotifier credential=ValueNotifier('');
  void login(BuildContext context) async {
    try {
      await Firebaseservices()
          .signin(emailController.text, passwordController.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Failed: $e')),
      );
    }
  }

 void googleSignIn(BuildContext context) async {
  try {
    // Ensure Firebaseservices and signinwithgoogle are correctly initialized
    final firebaseService = Firebaseservices();
    if (firebaseService == null) {
      throw 'Firebase service is not initialized';
    }

    await firebaseService.signinwithgoogle();
    
    // Make sure context is valid before pushing
    if (context != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
    } else {
      throw 'Context is null';
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login Failed: $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
              SizedBox(height: 20),
              Textfield1(controller: emailController, text: 'Email'),
              SizedBox(height: 10),
              Textfield1(controller: passwordController, text: 'Password'),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => login(context),
                child: Text('Submit'),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()),
                  );
                },
                child: Text('Sign Up'),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Image.network(
                    "https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo-thumbnail.png",
                    width: 50),
                onTap: () {googleSignIn(context);},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
