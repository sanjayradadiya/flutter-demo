import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  String get resultPhrase {
    var resultText = "You did it !";
    if (resultScore <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (resultScore <= 12) {
      resultText = "Pretty likable!";
    } else if (resultScore <= 16) {
      resultText = "Yor are strage!";
    } else {
      resultText = "You are so bad";
    }
    return resultText;
  }

  Result({required this.resultScore, required this.resetHandler});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.orange),
            //   foregroundColor: MaterialStateProperty.all(Colors.white),
            // ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            onPressed: resetHandler,
            child: Text("Restart Quiz !"),
            // color: Colors.blue,
            // textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
