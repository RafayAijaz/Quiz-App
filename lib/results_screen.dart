import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});
  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summary.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: "Rubik Medium"),
          ),
          SizedBox(
            height: 30,
          ),
          QuestionsSummary(summary),
          SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: onRestart,
            icon: Icon(Icons.restart_alt),
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                overlayColor: Colors.black,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5))),
            label: Text(
              "Restart Quiz",
              style: TextStyle(fontFamily: "Rubik Medium", fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
