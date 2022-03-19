import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Какой твой любимый цвет?',
      'answers': [
        {'text': 'Чёрный', 'score': 10},
        {'text': 'Красный', 'score': 5},
        {'text': 'Зелёный', 'score': 3},
        {'text': 'Белый', 'score': 1}
      ],
    },
    {
      'questionText': 'Какое твоё любимое животное?',
      'answers': [
        {'text': 'Кролик', 'score': 3},
        {'text': 'Змея', 'score': 11},
        {'text': 'Слоник (но не зелёный)', 'score': 5},
        {'text': 'Лев, в цирке', 'score': 9}
      ],
    },
    {
      'questionText': 'К т о самый сасный?',
      'answers': [
        {'text': 'Родя', 'score': 1},
        {'text': 'Родя', 'score': 1},
        {'text': 'Родя', 'score': 1},
        {'text': 'Родя', 'score': 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    //print(_questionIndex);
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    //print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Моё первое приложение'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
