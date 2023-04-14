import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 70,
      padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xFF1AD3F3), onPrimary: Colors.black),
        child: Text(answerText,style: TextStyle(fontSize: 20)),
        onPressed: selectHandler,
      ),
    );
  }
}