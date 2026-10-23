import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<SummaryItem> get summary => [
        for (var i = 0; i < chosenAnswers.length; i++)
          SummaryItem(
            index: i,
            question: questions[i].text,
            correctAnswer: questions[i].correctAnswer,
            userAnswer: chosenAnswers[i],
            explanation: questions[i].explanation,
          ),
      ];

  String _feedback(double score) {
    if (score == 1) return 'Perfect score! You think like a defender. 🛡️';
    if (score >= 0.7) return 'Great job! Your security basics are solid.';
    if (score >= 0.4) return 'Not bad. Review the explanations below.';
    return 'Keep learning. Every expert started here!';
  }

  @override
  Widget build(BuildContext context) {
    final items = summary;
    final total = questions.length;
    final correct = items.where((item) => item.isCorrect).length;
    final score = correct / total;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: score,
                  strokeWidth: 10,
                  color: score >= 0.7 ? Colors.greenAccent : Colors.amber,
                  backgroundColor: Colors.white24,
                ),
                Center(
                  child: Text(
                    '${(score * 100).round()}%',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'You answered $correct out of $total questions correctly',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 6),
          Text(
            _feedback(score),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
          ),
          const SizedBox(height: 20),
          Expanded(child: QuestionsSummary(items)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: onRestart,
            icon: const Icon(Icons.restart_alt),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            label: const Text('Restart Quiz', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
