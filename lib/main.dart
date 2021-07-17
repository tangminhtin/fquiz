import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What color do you like?",
      "answers": [
        {
          "text": "red",
          "score": 10,
        },
        {
          "text": "green",
          "score": 8,
        },
        {
          "text": "blue",
          "score": 6,
        },
        {
          "text": "yellow",
          "score": 5,
        },
      ],
    },
    {
      "questionText": "What is the pet do you like?",
      "answers": [
        {
          "text": "cat",
          "score": 6,
        },
        {
          "text": "dog",
          "score": 8,
        },
        {
          "text": "duck",
          "score": 10,
        },
      ]
    },
    {
      "questionText": "What are you doing?",
      "answers": [
        {
          "text": "watch tv",
          "score": 9,
        },
        {
          "text": "listen to music",
          "score": 8,
        },
        {
          "text": "play game",
          "score": 7,
        },
      ]
    },
    {
      "questionText": "What kind of music do you like?",
      "answers": [
        {
          "text": "pop",
          "score": 9,
        },
        {
          "text": "jazz",
          "score": 10,
        },
        {
          "text": "rock",
          "score": 7,
        }
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
