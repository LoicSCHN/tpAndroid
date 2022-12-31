import '../Models/Question.dart';

class QuestionAll {
  List<Question> listQuestion = [];
  List<Question> listQuestionMontagne = [];
  List<Question> listQuestionDrapeau = [];


  QuestionAll(){

  }


  Question getQuestion(int number) {
    return listQuestion[number];
  }

  Question getQuestionMontagne(int number) {
    return listQuestionMontagne[number];
  }

  Question getQuestionDrapeau(int number) {
    return listQuestionDrapeau[number];
  }
}