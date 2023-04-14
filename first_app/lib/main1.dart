import 'package:first_app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:first_app/chem.dart';
import './homepage.dart';
import 'result.dart';

void main() => runApp(Pap());

class Pap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/d': (context) => Dashboard(),
      '/geo': (context) => HomePage(),
      '/chem': (context) => chem(),
    });
  }
}