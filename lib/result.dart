import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'Ты классный и невинный!';
    } else if (resultScore <= 12) {
      resultText = 'Ти симпотиШный :3';
    } else if (resultScore <= 16) {
      resultText = 'Ты какой-то... странный?!';
    } else {
      resultText = 'Ты такой плохоооой!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '\nТвои "плохие" очки: $resultScore',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: const Text(
              'Перезапутить вопросики!',
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
