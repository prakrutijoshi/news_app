import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/hompage.dart';
import 'package:news_app/bloc/news_sources_bloc.dart';
import 'package:news_app/screens/welcome.dart';
import 'package:news_app/screens/signin.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter news app',
      initialRoute: '/',
      routes: Navigate.routes,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

class Navigate {

  static Map<String, Widget Function(BuildContext)> routes =   {
    '/' : (context) => WelcomePage(),
    '/signIn' : (context) => SignInPage(),
    '/home'  : (context) =>
        BlocProvider(
          create: (BuildContext context) => NewsSourcesBloc()..add(NewSourcesLoadingEvent()),
          child: const MyHomePage(),
        ),
  };

}


