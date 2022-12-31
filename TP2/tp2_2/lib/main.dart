import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tp2_2/block_quizz/cubit_state.dart';

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
    QuestionAll q = QuestionAll() ;
    return BlocProvider(
        create: (_) => QuizzCubit(q: q.listQuestion[0]),
        child: BlocBuilder<QuizzCubit, QuizzState>(
          builder: (_, theme) {
            return MaterialApp(
              title: 'First Flutter App Martin',
              theme: ThemeData(),
              home: QuizzPage(title: "QuizzApp"),
            );
          },
        ));
  }
}






