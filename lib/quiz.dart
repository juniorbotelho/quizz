import 'package:flutter/material.dart';
import 'package:quizz/answer.dart';
import 'package:quizz/question.dart';
import 'package:quizz/result.dart';

class Quiz extends StatelessWidget {
  final int indexed;
  final int score;
  final List<Map<String, Object>> questions;
  final void Function({int num}) onSelect;

  Quiz({
    @required this.indexed,
    @required this.score,
    @required this.questions,
    @required this.onSelect,
  });

  bool hasQuestions() {
    return this.indexed < this.questions.length ? true : false;
  }

  // Widget
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = this.hasQuestions()
        ? this.questions.elementAt(this.indexed)['answer']
        : null;

    return this.hasQuestions()
        ? Column(
            children: <Widget>[
              Question(text: this.questions[this.indexed]['text']),
              Answer(
                text: answers
                    .map((value) => {
                          'text': value['text'].toString(),
                          'score': value['score']
                        })
                    .toList(),
                index: [0, 1, 2, 3],
                onSelect: this.onSelect,
              ),
            ],
          )
        : Result(score: this.score);
  }
}
