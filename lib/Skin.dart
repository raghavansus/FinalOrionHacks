import 'package:eye_detector/GeneralHealth.dart';
import 'package:eye_detector/NearbyDoc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Eyes.dart';
import 'main.dart';

void main() {
  runApp(Skin());
}

class Skin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: SkinPage(),


    );

    // TODO: implement build
  }
}

class SkinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new skinpage();
}

class skinpag extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(

        color: Colors.blue,
      ),
    );
  }
}

class skinpage extends State<StatefulWidget> {
  final _questions = const [
    {
      'questionText': 'Q1. What is your Sex?',
      'answers': [
        {'text': 'Male', 'score': 2},
        {'text': 'Female', 'score': 0},
        {'text': 'Prefer Not to Answer', 'score': 0},
      ],
    },
    {
      'questionText': 'Q2. Which Age Group are you in?',
      'answers': [
        {'text': '0 - 12 years old', 'score': 1},
        {'text': '13 - 36 years old', 'score': -2},
        {'text': '37 - 60 years old', 'score': 0},
        {'text': '61+ years old', 'score': 2},
      ],
    },
    {
      'questionText': ' Q3. On a scale of 1 - 5 how itchy is your skin',
      'answers': [
        {'text': '1', 'score': 1},
        {'text': '2', 'score': 2},
        {'text': '3', 'score': 3},
        {'text': '4', 'score': 4},
        {'text': '5', 'score': 5},
      ],
    },
    {
      'questionText': 'Q4. Do you have any hot/ red marks on your skin?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Q5. Does your daily diet include dairy products?',
      'answers': [
        {'text': 'Yes', 'score': 10,},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': ' Q6. How many hours in the sun do you get per week?',
      'answers': [
        {'text': '0-1', 'score': 1},
        {'text': '2-4', 'score': 2},
        {'text': '5-7', 'score': 3},
        {'text': '8-10', 'score': 4},
        {'text': '11+', 'score': 5},
      ],
    },
    {
      'questionText': ' Q7. How often do you smoke per week?',
      'answers': [
        {'text': 'Never', 'score': 0},
        {'text': 'Once a week', 'score': 2},
        {'text': 'Twice a week', 'score': 3},
        {'text': 'More than 3 times a week', 'score': 4},
        {'text': 'All the time', 'score': 5},
      ],
    },
    {
      'questionText': ' Q8. Do you or anyone in you family have/had diabetes?',
      'answers': [
        {'text': 'Prefer not to answer', 'score': 0},
        {'text': 'Yes', 'score': 5},
        {'text': 'No', 'score': 0},
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
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questionare about your skin'),
          // textTheme: ,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Color(0xFF90CAF9),
            // gradient: LinearGradient(
            //     begin: Alignment.topLeft, end: Alignment.bottomRight,
            //     // 0xFFF57C00 <- darker orange used for the icon ones
            //     // Colors.blue <- darker blue used for the icon ones
            //     //FF90CAF9 <- light blue
            //     //FFFFCC80 <- light orange
            //     colors: [const Color(0xFF90CAF9), const Color(0xFFFFCC80)]),
          ),
          child: Padding(

            padding: const EdgeInsets.all(30.0),
            child: _questionIndex < _questions.length
                ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            ) //Quiz
                : Result(_totalScore, _resetQuiz),
          ),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  //Remark Logic
  String get resultPhrase {
    double score = 100 * (resultScore/42);
    int printS = score.toInt();
    String resultText;

    resultText = 'You have a $printS % chance of having a skin disease';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          //Text
          FlatButton(
            child: Text(
              'Take a photo of your skin',
            ), //Text
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
          FlatButton(
            child: Text(
              'Skip Photo and get percentage of skin disease',
            ), //Text
            textColor: Colors.blue,
            onPressed: resetHandler,
          ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(


      width: double.infinity,
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width/2,
        margin: EdgeInsets.all(10),
        child: CupertinoButton(
          //const Color(0xFFFFCC80)
          color: Color(0xFFFFCC80),
          // textColor: Colors.black,
          child: Text(
              answerText,
              style: TextStyle(
                  color: Colors.black
              )
          ),
          onPressed: selectHandler,
        ),
      ),

    );

    //Container
  }
}

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    this.questions,
    this.answerQuestion,
    this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ), //Question
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    ); //Column
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ), //Text
    ); //Contaier
  }
}
