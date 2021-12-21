import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
    {
      "questionText": "What's your favorite color ?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ]
    },
    {
      "questionText": "What's your favorite animal ?",
      "answers": [
        {"text": "Rabbit", "score": 10},
        {"text": "Snake", "score": 5},
        {"text": "Elephant", "score": 3},
        {"text": "Lion", "score": 1}
      ]
    },
    {
      "questionText": "What's your favorite person ?",
      "answers": [
        {"text": "Sanjay", "score": 10},
        {"text": "Ankash", "score": 5},
        {"text": "Hardik", "score": 3},
        {"text": "Jignesh", "score": 1}
      ]
    },
  ];
  int qIndex = 0;
  int totalScore = 0;

  void _answersQuestion(int score) {
    totalScore += score;
    setState(() {
      qIndex = qIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      totalScore = 0;
      qIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: qIndex < questions.length
            ? Quiz(
                answerQuestion: _answersQuestion,
                questions: questions,
                qIndex: qIndex)
            : Result(
                resultScore: totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
