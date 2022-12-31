import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Questions/Question.dart';
import '../Questions/QuestionAll.dart';

class ProviderQuizz extends ChangeNotifier {

  static QuestionAll questions = QuestionAll();

  Color correct = Colors.blueGrey;
  Color wrong = Colors.blueGrey;
  bool hasAnwsered = false;
  int cmpt = 0;
  Question question = questions.listQuestion[0];

  void repQuestion() {
    print("anwser") ;
    hasAnwsered = true;
    if (question.isCorrect) {
      correct = Colors.green; wrong = Colors.red;
    }else {
      wrong = Colors.green; correct = Colors.red;
    }
    notifyListeners();
  }

  void nextQuestion() {
    if (hasAnwsered) {
      if(cmpt == questions.listQuestion.length -1){
        cmpt= 0;
      }else{
        cmpt= cmpt+1;
      }

      question = questions.listQuestion[cmpt];
      hasAnwsered = false;
      wrong = Colors.blueGrey;
      correct = Colors.blueGrey;
      notifyListeners();
    }
  }
}
