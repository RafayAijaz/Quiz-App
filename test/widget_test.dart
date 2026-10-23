import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  testWidgets('Answering every question correctly gives a perfect score',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const Quiz(useGoogleFonts: false));

    expect(find.text('Test Your Cybersecurity Knowledge'), findsOneWidget);
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    for (var i = 0; i < questions.length; i++) {
      expect(
        find.text('Question ${i + 1} of ${questions.length}'),
        findsOneWidget,
      );
      await tester.tap(find.text(questions[i].correctAnswer));
      await tester.pumpAndSettle();
    }

    expect(find.text('100%'), findsOneWidget);
    expect(
      find.text(
        'You answered ${questions.length} out of ${questions.length} questions correctly',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Restart Quiz'));
    await tester.pumpAndSettle();
    expect(find.text('Start Quiz'), findsOneWidget);
  });

  testWidgets('A wrong answer shows the correct answer in the summary',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const Quiz(useGoogleFonts: false));
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    for (var i = 0; i < questions.length; i++) {
      // Pick a wrong answer for the first question only.
      final answer = i == 0 ? questions[i].answers[1] : questions[i].correctAnswer;
      await tester.tap(find.text(answer));
      await tester.pumpAndSettle();
    }

    expect(find.text('90%'), findsOneWidget);
    expect(find.byIcon(Icons.cancel), findsOneWidget);
  });
}
