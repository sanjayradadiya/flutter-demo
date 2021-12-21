import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function(int) answerQuestion;
  final List<Map<String, Object>> questions;
  final int qIndex;

  Quiz({
    required this.answerQuestion,
    required this.questions,
    required this.qIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          (questions[qIndex]["questionText"] as String),
        ),
        ...(questions[qIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            () => answerQuestion(answer["score"] as int),
            answer["text"] as String,
          );
        }).toList()
      ],
    );
  }
}
