import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int _questionIndex = 0;

  // Shuffled once per question, so answers don't jump around
  // when the widget rebuilds (e.g. on window resize).
  late List<String> _shuffledAnswers =
      questions[_questionIndex].getShuffledAnswers();

  void _answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex++;
        _shuffledAnswers = questions[_questionIndex].getShuffledAnswers();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_questionIndex];
    final progress = (_questionIndex + 1) / questions.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Question ${_questionIndex + 1} of ${questions.length}',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              color: Colors.amber,
              backgroundColor: Colors.white24,
            ),
          ),
          const SizedBox(height: 36),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Column(
              key: ValueKey(_questionIndex),
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 32),
                for (final answer in _shuffledAnswers)
                  AnswerButton(
                    text: answer,
                    onTap: () => _answerQuestion(answer),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
