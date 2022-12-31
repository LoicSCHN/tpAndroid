class Question {
  String questionText;
  bool isCorrect;
  String image;
  String theme;
  Question({required this.questionText, required this.isCorrect, required this.image, required this.theme});

  factory Question.fromJson(Map<dynamic, dynamic> json) => Question(
      questionText: json['questionText'] as String,
      isCorrect: json['isCorrect'] as bool,
      image: json['image'] as String,
      theme: json['theme'] as String);


  Map<String, dynamic> toJson() => <String, dynamic>{
    'questionText': questionText,
    'isCorrect': isCorrect,
    'image': image,
    'theme': theme,
  };
}