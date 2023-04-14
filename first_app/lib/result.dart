import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './login_screen.dart';
import './main.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = '';
    if (resultScore == 3) {
      resultText = 'You are Brilliant';
    } else if (resultScore == 2) {
      resultText = 'You are Good';
    } else if (resultScore == 1) {
      resultText = 'You are not Bad';
    } else {
      resultText = 'You are Dumb';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PSB Quiz'),
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          TextButton(
              child: Text(
                'Restart Quiz!',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: resetHandler,
              style: TextButton.styleFrom(
                  foregroundColor: Colors.red)
          ),
          SizedBox(height: 10),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),

          Text('You have Scored '+resultScore.toString()+' Points',style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1AD3F3))),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: Text('Dashboard'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                          (r) => false);
                }),
          ),
          SizedBox(height: 300),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                      (r) => false);
            },
            color: Colors.blue,
            child: Text('Sign Out'),
          )
        ],
      ),
    ),
    );
  }
}