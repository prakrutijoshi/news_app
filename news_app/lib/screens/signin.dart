import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/firebaseservice.dart';
import 'googlesignin.dart';



class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black87, width: 3),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child:
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: GoogleSignIn()),
                //buildRowDivider(size: size),
                // Padding(padding: EdgeInsets.only(bottom: size.height * 0.02)),
                // SizedBox(
                //   height: size.height * 0.07,
                //   width: size.width * 0.8,
                //   child: OutlinedButton(
                //     onPressed: () async {
                //       FirebaseService service = new FirebaseService();
                //       try {
                //         await service.signInwithGoogle();
                //         Navigator.pushNamedAndRemoveUntil(
                //             context, '/home', (route) => false);
                //       } catch (e) {
                //         if (e is FirebaseAuthException) {
                //           AlertDialog(
                //             title: const Text("Error"),
                //             content: Text(e.message),
                //             actions: [
                //               TextButton(
                //                 child: const Text("Ok"),
                //                 onPressed: () {
                //                   Navigator.of(context).pop();
                //                 },
                //               )
                //             ],
                //           );
                //         }
                //       }
                //     },
                //   ),
                // ),
                    // child: const Text("Sign In", style: TextStyle(
                    //     fontSize: 20, fontWeight: FontWeight.bold),),
                    // style: ButtonStyle(
                    //     foregroundColor:
                    //     MaterialStateProperty.all<Color>(
                    //         Colors.deepPurpleAccent),
                    //     backgroundColor:
                    //     MaterialStateProperty.all<Color>(Colors.black87),
                    //     side: MaterialStateProperty.all<BorderSide>(
                    //         BorderSide.none)),
              ]),
      ),

    );
  }
}

