import 'package:flutter/material.dart';
import 'package:quizz/answer.dart';
import 'package:quizz/question.dart';

main() => runApp(QuizzApp());

class _QuizzAppState extends State<QuizzApp> {
  int indexed = 0;
  final List<Map<String, Object>> questions = const [
    {
      'text': 'Which is your favorite color?',
      'answer': ['black', 'red', 'green', 'white']
    },
    {
      'text': 'Which is your favorite animal?',
      'answer': ['rabbit', 'snake', 'elephant', 'lion']
    },
    {
      'text': 'Which is your favorite instructor?',
      'answer': ['maria', 'joão', 'leo', 'pedro']
    }
  ];

  bool hasQuestions() {
    return this.indexed < this.questions.length ? true : false;
  }

  void questionResponse({int num = 0}) {
    setState(() => this.indexed++);
  }

  Widget screenResponse() {
    return this.hasQuestions()
        ? Column(
            children: <Widget>[
              Question(text: this.questions.elementAt(this.indexed)['text']),
              Answer(
                text: this.questions.elementAt(this.indexed)['answer'],
                index: [0, 1, 2, 3],
                onSelect: this.questionResponse,
              )
            ],
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz'),
          backgroundColor: Colors.redAccent,
        ),
        body: this.screenResponse(),
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
