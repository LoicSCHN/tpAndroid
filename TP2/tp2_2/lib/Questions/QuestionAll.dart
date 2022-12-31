import 'Question.dart';

class QuestionAll {
  List<Question> listQuestion = [];
  List<Question> listQuestionMontagne = [];
  List<Question> listQuestionDrapeau = [];

  Question q1 =  Question(questionText: "Le sommet du mont-blanc culmine à 4810 mêtres d'altitude.", isCorrect: true, image: 'montblanc.jpg');
  Question q2 =  Question(questionText: "Le sommet du mont-blanc est toujours enneigé.", isCorrect: true, image: 'montblanc.jpg');
  Question q3 =  Question(questionText: "Le mont-blanc est situé uniquement en France.", isCorrect: false, image: 'montblanc.jpg');
  Question q4 =  Question(questionText: "Il est possible de bivouaquer au sommet du mont-blanc.", isCorrect: true, image: 'montblanc.jpg');

  Question q5 =  Question(questionText: "Ce drapeau est celui de l'Allemagne.", isCorrect: false, image: 'belgique.png');
  Question q6 =  Question(questionText: "Ce drapeau est celui de la Norvege.", isCorrect: false, image: 'danemark.png');
  Question q7 =  Question(questionText: "Ce drapeau est celui de la Norvege.", isCorrect: true, image: 'norvege.png');
  Question q8 =  Question(questionText: "Ce drapeau est celui des Pays-Bas.", isCorrect: true, image: 'paysbas.png');
  QuestionAll(){
    listQuestion.add(q1);
    listQuestion.add(q2);
    listQuestion.add(q3);
    listQuestion.add(q4);

    listQuestion.add(q5);
    listQuestion.add(q6);
    listQuestion.add(q7);
    listQuestion.add(q8);

    listQuestionMontagne.add(q1);
    listQuestionMontagne.add(q2);
    listQuestionMontagne.add(q3);
    listQuestionMontagne.add(q4);

    listQuestionDrapeau.add(q5);
    listQuestionDrapeau.add(q6);
    listQuestionDrapeau.add(q7);
    listQuestionDrapeau.add(q8);
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