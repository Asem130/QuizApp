import 'package:flutter/material.dart';
import 'package:quizeapp/data/questions.dart';
import 'package:quizeapp/qusetion_screen.dart';
import 'package:quizeapp/result_sceen.dart';
import 'package:quizeapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswerd = [];

  void chooseAnswer(answer) {
    selectedAnswerd.add(answer);
    if (selectedAnswerd.length == questions.length) {
      setState(() {
        
        activeScreen = 'result-screen';
      });
    }
  }

  var activeScreen = 'start-screen';

  List<String> answers = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(answerdQuestion: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      screenWidget=  ResultScreen(choosenAnswers: selectedAnswerd,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 68, 11, 167),
                  Color.fromARGB(255, 43, 1, 86)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
