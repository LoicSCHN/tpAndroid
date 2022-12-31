import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider_quizz/ProviderQuizz.dart';



class QuizzPage extends StatelessWidget {
    QuizzPage({Key? key}) : super(key: key);

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
            _getImage(context),
            const SizedBox(height: 50),
            _getQuestion(context),
            const SizedBox(height: 50),
            _getButtons(context),
          ],
        ),
      ),
    );
  }

  Container _getButtons(BuildContext context) {
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
                      style: _getBtnStyle(color: Provider.of<ProviderQuizz>(context, listen: true).correct),
                      onPressed: () {
                        Provider.of<ProviderQuizz>(context, listen: false).repQuestion() ;
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
                      style: _getBtnStyle(color: Provider.of<ProviderQuizz>(context, listen: true).wrong),
                      onPressed: () {
                        Provider.of<ProviderQuizz>(context, listen: false).repQuestion() ;
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
                          Provider.of<ProviderQuizz>(context, listen: false).nextQuestion() ;
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

  Container _getQuestion(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300.00,
      child: Text(Provider.of<ProviderQuizz>(context, listen: true).question.questionText,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Container _getImage(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 300.00,
        height: 300.00,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/${Provider.of<ProviderQuizz>(context, listen: true).question.image}'),
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