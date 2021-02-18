import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final List<String> text;
  final void Function({int num}) onSelect;
  final List<int> index;

  Answer({this.text, this.onSelect, this.index});

  Widget build(BuildContext context) {
    return Column(
      children: this.index.map((index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: RaisedButton(
            color: Colors.redAccent,
            textColor: Colors.white,
            child: Text(this.text.elementAt(index)),
            onPressed: () => this.onSelect(num: index),
          ),
        );
      }).toList(),
    );
  }
}
