import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3/Data/Models/Question.dart';
import 'package:tp3/Data/Repositories/QuestionAll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String choix = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: _getAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            const Text("Menu du Quizz",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            _getMenu(),
          ],
        ),
      ),
    );
  }
  Container _getMenu() {
    return Container(
        margin: const EdgeInsets.only(
            left: 30.0, top: 0.0, right: 30.0, bottom: 0.0),
        alignment: Alignment.center,
        child: Column(children: <Widget>[
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
                            choix = 'Montagne';
                            Navigator.pushNamed(
                              context,
                              "/quizz",
                              arguments: QuestionAll().listQuestionMontagne,
                            );
                          });
                        },
                        child: const Text("Montagne",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ))),
            ],
          ),
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
                            choix = 'Drapeaux';
                            Navigator.pushNamed(
                              context,
                              "/quizz",
                              arguments: QuestionAll().listQuestionDrapeau,
                            );
                          });
                        },
                        child: const Text("Drapeaux",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ))),
            ],
          ),
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
                            Navigator.pushNamed(
                              context,
                              "/add",
                              arguments: QuestionAll().listQuestionDrapeau,
                            );
                          });
                        },
                        child: const Text("Ajouter une question",
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

  AppBar _getAppBar() {
    return AppBar(
      title: const Text("Menu"),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    );
  }
}
