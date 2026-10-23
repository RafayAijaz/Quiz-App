import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions.dart';

import 'first_screen.dart';
import 'results_screen.dart';

enum QuizScreen { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key, this.useGoogleFonts = true});

  /// Turned off in widget tests, which have no network access.
  final bool useGoogleFonts;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  QuizScreen _screen = QuizScreen.start;

  void _startQuiz() {
    setState(() => _screen = QuizScreen.questions);
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _screen = QuizScreen.start;
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() => _screen = QuizScreen.results);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget activeScreen = switch (_screen) {
      QuizScreen.start => FirstScreen(_startQuiz),
      QuizScreen.questions => Questions(onSelectAnswer: _chooseAnswer),
      QuizScreen.results => ResultsScreen(
          chosenAnswers: _selectedAnswers,
          onRestart: _restartQuiz,
        ),
    };

    return MaterialApp(
      title: 'CyberQuiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        textTheme: widget.useGoogleFonts
            ? GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme)
            : null,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade800,
                const Color.fromARGB(255, 104, 33, 191),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: SafeArea(
            child: Center(
              // Keeps the layout readable on wide screens (web/desktop).
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: KeyedSubtree(
                    key: ValueKey(_screen),
                    child: activeScreen,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
