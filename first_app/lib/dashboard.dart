import 'package:flutter/material.dart';
import 'chem.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07C1FA),
        title: Text('PSB Quiz'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: Image.asset('assets/images/image3.png',width: 260,height: 120,),
              onPressed: () {
                Navigator.pushNamed(context, '/geo');
              },
            ),
            SizedBox(height: 5),
            SizedBox(child:Text('Geography',style: TextStyle(fontSize: 30),),),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: Image.asset('assets/images/image2.png',width: 250,height: 120,),
              onPressed: () {
                Navigator.pushNamed(context, '/chem');
              },
            ),
            SizedBox(child:Text('Chemistry',style: TextStyle(fontSize: 30),),),
          ],
        ),
      ),
    );
  }
}
