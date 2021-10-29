import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User result = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/welcome.jpg'),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.9,
              child: OutlinedButton(
                onPressed: () {
                  result == null
                      ? Navigator.pushNamed(context, '/signIn' )
                      : Navigator.pushReplacementNamed(context,'/home');
                },
                child: const Text("Get started", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            // SizedBox(
            //   height: size.height * 0.07,
            //   width: size.width * 0.8,
            //   child: OutlinedButton(
            //     onPressed: () {},
            //     child: const Text("Sign In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            //     style: ButtonStyle(
            //       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            //       backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
            //       side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
