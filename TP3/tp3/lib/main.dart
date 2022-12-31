import 'package:flutter/material.dart';

import 'Data/Models/Question.dart';
import 'Data/Repositories/QuestionAll.dart';
import 'presentation/pages/EndPage.dart';
import 'presentation/pages/HomePage.dart';
import 'presentation/pages/QuizzPage.dart';
import 'presentation/pages/addPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(title: 'Menu'),
        '/quizz': (context) => const QuizzPage(title: 'Quizz'),
        '/fin': (context) => const EndPage(),
        '/add': (context) => const AddPage(title: 'Ajouter une question '),
      },
    );
  }
}






