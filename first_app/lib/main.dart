import 'package:first_app/homepage.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';
import './register.dart';
import 'package:firebase_core/firebase_core.dart';
import './chem.dart';
import './dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', routes: {
      '/': (context) => MyRegister(),
      '/first': (context) => LoginScreen(),
      '/d': (context) => Dashboard(),
      '/geo': (context) => HomePage(),
      '/chem': (context) => chem(),
      });
  }
}
