import 'package:flutter/material.dart';

class SummaryItem {
  const SummaryItem({
    required this.index,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
    required this.explanation,
  });

  final int index;
  final String question;
  final String correctAnswer;
  final String userAnswer;
  final String explanation;

  bool get isCorrect => userAnswer == correctAnswer;
}

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.items, {super.key});

  final List<SummaryItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, i) => _SummaryCard(item: items[i]),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.item});

  final SummaryItem item;

  @override
  Widget build(BuildContext context) {
    final statusColor =
        item.isCorrect ? Colors.greenAccent.shade100 : Colors.pink.shade200;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: statusColor,
            child: Text(
              '${item.index + 1}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.question,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                _AnswerLine(
                  icon: item.isCorrect ? Icons.check_circle : Icons.cancel,
                  label: 'Your answer',
                  text: item.userAnswer,
                  color: statusColor,
                ),
                if (!item.isCorrect) ...[
                  const SizedBox(height: 4),
                  _AnswerLine(
                    icon: Icons.check_circle_outline,
                    label: 'Correct answer',
                    text: item.correctAnswer,
                    color: Colors.greenAccent.shade100,
                  ),
                ],
                if (item.explanation.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    '💡 ${item.explanation}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnswerLine extends StatelessWidget {
  const _AnswerLine({
    required this.icon,
    required this.label,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 6),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: text),
              ],
            ),
            style: TextStyle(color: color, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
