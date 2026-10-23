import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions.dart';

import 'first_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;
  String activescr = "first-screen";


  void switchScreen() {
    setState(() {
      activescr = "questions-screen";
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activescr = "first-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescr = "results-screen";
      });
    }
  }

  @override
  Widget build(context) {
    if (activescr == "first-screen") {
      activeScreen = FirstScreen(switchScreen);
    } else if (activescr == "questions-screen") {
      activeScreen = Questions(onSelectAnswer: chooseAnswer);
    } else if (activescr == "results-screen") {
      activeScreen = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.purple.shade800,
              const Color.fromARGB(255, 104, 33, 191)
            ], begin: Alignment.bottomRight)),
            child: activeScreen),
      ),
    );
  }
}
