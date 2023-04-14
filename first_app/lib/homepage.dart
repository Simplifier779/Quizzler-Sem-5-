import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './main.dart';
import './quiz.dart';
import './result.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;
  final _questions = const [
    {
      'questionText': 'Which is largest Continent?',
      'answers': [
        {'text': 'Asia', 'score': 1},
        {'text': 'India', 'score': 0},
        {'text': 'Australia', 'score': 0},
        {'text': 'Africa', 'score': 0}
      ],
    },
    {
      'questionText': 'Which is fastest animal?',
      'answers': [
        {'text': 'Bird', 'score': 0},
        {'text': 'Cow', 'score': 0},
        {'text': 'Whale', 'score': 0},
        {'text': 'Cheetah', 'score': 1}
      ],
    },
    {
      'questionText': 'Where is Amazon?',
      'answers': [
        {'text': 'Brazil', 'score': 0},
        {'text': 'America', 'score': 0},
        {'text': 'Europe', 'score': 0},
        {'text': 'Africa', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score; // <- equals to '_totalScore = _totalScore + score;'.

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
