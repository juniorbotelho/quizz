import 'package:flutter/material.dart';
import 'package:quizz/quiz.dart';

main() => runApp(QuizzApp());

class _QuizzAppState extends State<QuizzApp> {
  int _indexed = 0;
  int _score = 0;
  final List<Map<String, Object>> questions = const [
    {
      'text': 'Which is your favorite color?',
      'answer': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 1}
      ]
    },
    {
      'text': 'Which is your favorite animal?',
      'answer': [
        {'text': 'rabbit', 'score': 10},
        {'text': 'snake', 'score': 5},
        {'text': 'elephant', 'score': 3},
        {'text': 'lion', 'score': 1},
      ]
    },
    {
      'text': 'Which is your favorite instructor?',
      'answer': [
        {'text': 'leo', 'score': 10},
        {'text': 'maria', 'score': 5},
        {'text': 'joão', 'score': 3},
        {'text': 'pedro', 'score': 1},
      ]
    }
  ];

  void onResponse({int num = 0}) {
    setState(() {
      this._indexed++;
      this._score += num;
    });
  }

  void onRefresh() {
    setState(() {
      this._indexed = 0;
      this._score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz'),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Quiz(
              indexed: this._indexed,
              score: this._score,
              questions: this.questions,
              onSelect: this.onResponse,
            ),
          ],
        ),
        drawer: Drawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.redAccent,
          onPressed: this.onRefresh,
        ),
      ),
    );
  }
}

// Quizz
class QuizzApp extends StatefulWidget {
  @override
  State<QuizzApp> createState() {
    return _QuizzAppState();
  }
}
