import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './quiz.dart';
import './result.dart';

class chem extends StatefulWidget {
  const chem({ Key? key}) : super(key: key);

  @override
  State<chem> createState() => _HomePageState();

}

class _HomePageState extends State<chem> {

  final user = FirebaseAuth.instance.currentUser!;
  final _questions = const [
    {
      'questionText':
      'One of the essential minerals in the human body is salt. How much salt (NaCl) is in the average adult human body?',
      'answers': [
        {'text': '25 grams of salt', 'score': 0},
        {'text': '150 grams of salt', 'score': 0},
        {'text': '500 grams of salt', 'score': 0},
        {'text': '250 grams of salt', 'score': 1}
      ],
    },
    {
      'questionText':
      'If you fill a glass to the brim with ice water and the ice melts, what will happen?',
      'answers': [
        {'text': 'Glass will break', 'score': 0},
        {'text': 'Full water will come out', 'score': 0},
        {'text': 'Nothing', 'score': 0},
        {
          'text': 'The water level will drop slightly as the ice melts.',
          'score': 1
        }
      ],
    },
    {
      'questionText':
      'The symbol Sb stands for stibnum or stibnite. What is the modern name of this element?',
      'answers': [
        {'text': 'Bauxite', 'score': 0},
        {'text': 'Coal', 'score': 0},
        {'text': 'Mine', 'score': 0},
        {'text': 'Antimony', 'score': 1}
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

    /// Similar shorthands :
    /// 1) Substraction   ->  _totalScore -= score;
    /// 2) Multilpication ->  _totalScore *= score;
    /// 3) Division       ->  _totalScore /= score;

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
