import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          data["user_answer"] == data["correct_answer"]
                              ? Colors.green.shade200
                              : Colors.pink.shade200,
                      child: Text(
                        ((data["question_index"] as int) + 1).toString(),
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Rubik Medium"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (data["question"]) as String,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Rubik Regular",
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            (data["correct_answer"]) as String,
                            style: TextStyle(
                              color: Colors.blue.shade200,
                              fontFamily: "Rubik Regular",
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            (data["user_answer"] as String),
                            style: TextStyle(
                              fontFamily: "Rubik Medium",
                              color:
                                  data["user_answer"] == data["correct_answer"]
                                      ? Colors.green.shade300
                                      : Colors.pink.shade300,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
