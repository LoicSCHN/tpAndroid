import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../Questions/Question.dart';
import '../Questions/QuestionAll.dart';

@immutable
abstract class QuizzState {}

class Quizz_Initial extends QuizzState {
  Question question;
  Color correct = Colors.blueGrey;
  Color wrong = Colors.blueGrey;
  bool hasAnswered = false;
  Quizz_Initial({required this.question, this.correct=Colors.blue, this.wrong=Colors.blueGrey, this.hasAnswered=false});
}

class QuizzCubit extends Cubit<QuizzState> {
  static QuestionAll questions = QuestionAll();

  Question q;
  bool answer = false;
  Color correct = Colors.blueGrey;
  Color wrong = Colors.blueGrey;
  int cmpt = 0;
  QuizzCubit({required this.q}) : super(Quizz_Initial(question: q));

  void repQuestion() {
    if (!answer) {
      if (q.isCorrect) {
        correct = Colors.green;
        wrong = Colors.red;
        answer = true;
        if(cmpt == questions.listQuestion.length -1){
          cmpt = 0;
        }else{
          cmpt = cmpt +1;
        }
        emit(Quizz_Initial(question: q, hasAnswered: answer, wrong: wrong, correct: correct));
      } else {
        wrong = Colors.green;
        correct = Colors.red;
        answer = true;
        if(cmpt == questions.listQuestion.length -1){
          cmpt = 0;
        }else{
          cmpt = cmpt +1;
        }
        emit(Quizz_Initial(question: q, hasAnswered: answer, wrong: wrong, correct: correct));
      }
    }
  }

  void nextQuestion() {
    if (answer) {
      if(cmpt == questions.listQuestion.length -1){
        cmpt = 0;
      }else{
        cmpt = cmpt +1;
      }
      Question newQuestion = questions.listQuestion[cmpt];
      q = newQuestion;
      answer = false;
      correct = Colors.blueGrey;
      wrong = Colors.blueGrey;
      emit(Quizz_Initial(question: newQuestion, hasAnswered: answer, wrong: wrong, correct: correct));
    }
  }

  Question get question => q;

  bool get hasAnswer => answer;

}