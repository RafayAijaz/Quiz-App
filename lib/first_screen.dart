import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Quiz-Logo.png', width: 300),
          const SizedBox(height: 24),
          const Text(
            'Test Your Cybersecurity Knowledge',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${questions.length} questions · Firewalls, phishing, malware, encryption & more',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 28),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: const StadiumBorder(),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
            icon: const Icon(Icons.arrow_right_alt_rounded, size: 26),
            label: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
