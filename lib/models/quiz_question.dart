/// A single multiple-choice question.
///
/// By convention the first item in [answers] is the correct one; the UI
/// always shows the answers in a shuffled order.
class QuizQuestion {
  const QuizQuestion(this.text, this.answers, {this.explanation = ''});

  final String text;
  final List<String> answers;

  /// Short explanation shown on the results screen.
  final String explanation;

  String get correctAnswer => answers.first;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
