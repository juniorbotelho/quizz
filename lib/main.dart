import 'package:flutter/material.dart';
import 'package:quizz/answer.dart';
import 'package:quizz/question.dart';

main() => runApp(QuizzApp());

class _QuizzAppState extends State<QuizzApp> {
  int indexed = 0;

  void handleQuestionResponse({int num = 0}) {
    setState(() => indexed = num);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [];

    // Questions
    questions.add('Which is your favorite color?');
    questions.add('Which is your favorite animal?');
    questions.add('Which is your favorite memorie?');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz'),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: <Widget>[
            Question(
              text: questions.elementAt(this.indexed),
            ),
            Answer(
              onSelect: this.handleQuestionResponse,
              text: ['Response 1', 'Response 2', 'Response 3'],
              index: [0, 1, 2],
            )
          ],
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
