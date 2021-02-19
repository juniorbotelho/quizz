import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final List<Map<String, Object>> text;
  final void Function({int num}) onSelect;
  final List<int> index;

  Answer({
    @required this.index,
    @required this.text,
    @required this.onSelect,
  });

  Widget build(BuildContext context) {
    return Column(
      children: this.index.map((index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
          child: RaisedButton(
            color: Colors.redAccent,
            textColor: Colors.white,
            child: Text(this.text.elementAt(index)['text']),
            onPressed: () =>
                this.onSelect(num: this.text.elementAt(index)['score']),
          ),
        );
      }).toList(),
    );
  }
}
