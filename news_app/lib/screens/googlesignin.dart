import 'package:flutter/material.dart';
import 'firebaseservice.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignIn extends StatefulWidget {
  GoogleSignIn({Key key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return !isLoading ? SizedBox(
      height: size.height *0.07,
      width: size.width * 0.8,
      child: OutlinedButton.icon(
        icon: Image.network(
            'http://pngimg.com/uploads/google/google_PNG19635.png',
            height: size.height*0.05,
            width: size.width*0.08,
            fit: BoxFit.cover
        ),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          FirebaseService service = new FirebaseService();
          try {
            await service.signInwithGoogle();
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          } catch (e) {
            if (e is FirebaseAuthException) {
              showMessage(e.message);
            }
          }
          setState(() {
            isLoading = false;
          });
        },
        label: const Text(
          "SignIn with Google",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.grey),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
      ),
    ) : const CircularProgressIndicator();
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
