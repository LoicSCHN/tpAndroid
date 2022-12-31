import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../block_quizz/cubit_state.dart';

class QuizzPage extends StatelessWidget {
  const QuizzPage({Key? key, String? title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizzCubit = context.read<QuizzCubit>();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: _getAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            _getImage(quizzCubit),
            const SizedBox(height: 50),
            _getQuestion(quizzCubit),
            const SizedBox(height: 50),
            _getButtons(quizzCubit),
          ],
        ),
      ),
    );
  }

  Container _getButtons(QuizzCubit quizzCubit) {
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
                      style: _getBtnStyle(color: quizzCubit.correct),
                      onPressed: () {
                        quizzCubit.repQuestion();
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
                      style: _getBtnStyle(color: quizzCubit.wrong),
                      onPressed: () {
                        quizzCubit.repQuestion();
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

  Container _getQuestion(QuizzCubit quizzCubit) {
    return Container(
      alignment: Alignment.center,
      width: 300.00,
      child: Text(quizzCubit.question.questionText,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Container _getImage(QuizzCubit quizzCubit) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 300.00,
        height: 300.00,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/${quizzCubit.question.image}'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
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