import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final int score;

  Result({
    @required this.score,
  });

  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Congratulations, you scored ${this.score} points',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
