import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_1/Provider_quizz/ProviderQuizz.dart';

import 'Questions/Question.dart';
import 'Questions/QuestionAll.dart';

import 'View/QuizzPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderQuizz(),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home:  QuizzPage(),
    )
    );
  }
}






