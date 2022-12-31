import 'package:flutter/material.dart';

import '../../Data/Models/Question.dart';
import '../../Data/Repositories/QuestionAll.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuizzPage> createState() => SomeQuizzPageState();
}



class SomeQuizzPageState extends State<QuizzPage> {
  Color correct = Colors.blueGrey;
  Color wrong = Colors.blueGrey;
  bool hasAnwsered = false; // Est ce que l'utilisateur a répondu
  int cmpt = 0; // compteur de question
  int score = 0; // compteur de bonne réponse

  @override
  Widget build(BuildContext context) {
    List<Question> q = ModalRoute.of(context)!.settings.arguments as List<Question>;


    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: _getAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            _getImage(q),
            const SizedBox(height: 50),
            _getQuestion(q),
            const SizedBox(height: 50),
            _getButtons(q),
            // const SizedBox(height: 50),
            //_getScore(),
          ],
        ),
      ),
    );
  }

  Container _getButtons(List<Question> question) {
    return Container(
        margin: const EdgeInsets.only(
            left: 30.0, top: 0.0, right: 30.0, bottom: 0.0),
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: TextButton(
                      style: _getBtnStyle(color: correct),
                      onPressed: () {
                        if (question[cmpt].isCorrect) {
                          setState(() {
                            correct = Colors.green;
                            wrong = Colors.red;
                            hasAnwsered = true;
                            score++;
                          });
                        } else {
                          setState(() {
                            wrong = Colors.green;
                            correct = Colors.red;
                            hasAnwsered = true;
                          });
                        }
                      },
                      child: const Text("VRAI",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ))),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: TextButton(
                      style: _getBtnStyle(color: wrong),
                      onPressed: () {
                        if (question[cmpt].isCorrect) {
                          setState(() {
                            correct = Colors.green;
                            wrong = Colors.red;
                            hasAnwsered = true;
                          });
                        } else {
                          setState(() {
                            wrong = Colors.green;
                            correct = Colors.red;
                            hasAnwsered = true;
                            score++;
                          });
                        }
                      },
                      child: const Text("FAUX",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ))),
          ]),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 30, right: 30.0, top: 10.0),
                      child: TextButton(
                        style: _getBtnStyle(),
                        onPressed: () {
                          setState(() {
                            if (hasAnwsered) {
                              //question = QuestionRepository().getAnotherQuestion(question);
                              if (cmpt == 3) {
                                Navigator.pushNamed(
                                  context,
                                  "/fin",
                                  arguments: score,
                                );
                                cmpt = 0;
                                score = 0;
                              } else {
                                cmpt = cmpt + 1;
                              }
                              correct = Colors.blueGrey;
                              wrong = Colors.blueGrey;
                              hasAnwsered = false;
                            }
                          });
                        },
                        child: const Text("Question suivante",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ))),
            ],
          ),
        ]));
  }

  ButtonStyle _getBtnStyle({Color color = Colors.blueGrey}) {
    return ElevatedButton.styleFrom(
      primary: color,
      onPrimary: Colors.white,
      shadowColor: Colors.blueGrey,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      minimumSize: const Size(100, 75),
    );
  }

  Container _getQuestion(List<Question> question) {
    return Container(
      alignment: Alignment.center,
      width: 300.00,
      child: Text(question[cmpt].questionText,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Container _getImage(List<Question> question) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 300.00,
        height: 300.00,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/${question[cmpt].image}'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Container _getScore() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30.0, top: 10.0),
      child: Text("score : $score",
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text("quizz"),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    );
  }
}