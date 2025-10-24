import 'package:flutter/material.dart';
import '../../core/services/progress_service.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final progressService = ProgressService();
  int current = 0;
  int score = 0;
  bool submitted = false;

  final List<Map<String, dynamic>> questions = [
    {
      'q': 'What is the 50-30-20 budgeting rule?',
      'options': [
        '50% needs, 30% wants, 20% savings',
        '50% savings, 30% rent, 20% fun',
        '50% stocks, 30% crypto, 20% cash',
      ],
      'answer': 0,
    },
    {
      'q': 'What does ROI stand for?',
      'options': [
        'Rate of Investment',
        'Return on Investment',
        'Revenue on Interest',
      ],
      'answer': 1,
    },
    {
      'q': 'Which of the following is considered a liability?',
      'options': ['A car loan', 'A savings account', 'A stock portfolio'],
      'answer': 0,
    },
    {
      'q': 'What does diversification in investing mean?',
      'options': [
        'Investing in different assets to reduce risk',
        'Buying only one type of stock repeatedly',
        'Avoiding any investment risk',
      ],
      'answer': 0,
    },
    {
      'q': 'What is a good credit score range (out of 900) in India?',
      'options': ['300–500', '700–900', '500–650'],
      'answer': 1,
    },
    {
      'q': 'What is an emergency fund used for?',
      'options': [
        'Vacation and entertainment',
        'Unexpected expenses or job loss',
        'Regular monthly bills',
      ],
      'answer': 1,
    },
    {
      'q': 'What does inflation represent?',
      'options': [
        'Decrease in prices over time',
        'Increase in the value of money',
        'Increase in prices over time',
      ],
      'answer': 2,
    },
    {
      'q': 'What is compound interest?',
      'options': [
        'Interest calculated on the principal only',
        'Interest calculated on principal and accumulated interest',
        'Interest given only once per year',
      ],
      'answer': 1,
    },
    {
      'q': 'What is the safest type of investment among these?',
      'options': ['Government bonds', 'Cryptocurrency', 'Penny stocks'],
      'answer': 0,
    },
    {
      'q': 'What is meant by net worth?',
      'options': [
        'Total income per year',
        'Total assets minus total liabilities',
        'Monthly salary after deductions',
      ],
      'answer': 1,
    },
  ];

  int? selected;

  void _submit() async {
    if (selected == questions[current]['answer']) score++;
    if (current < questions.length - 1) {
      setState(() {
        current++;
        selected = null;
      });
    } else {
      setState(() => submitted = true);
      await progressService.saveQuizScore(score);
    }
  }

  String getResultMessage() {
    if (score < 3) return "Try harder next time.";
    if (score < 7) return "Keep learning.";
    if (score < 10) return "Very good, keep it up.";
    return "You aced it!";
  }

  @override
  Widget build(BuildContext context) {
    if (submitted) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz Results')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your score: $score / ${questions.length}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                getResultMessage(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      );
    }

    final q = questions[current];
    return Scaffold(
      appBar: AppBar(title: const Text('Finance Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${current + 1}. ${q['q']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < q['options'].length; i++)
              RadioListTile<int>(
                title: Text(q['options'][i]),
                value: i,
                groupValue: selected,
                onChanged: (val) => setState(() => selected = val),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: selected != null ? _submit : null,
              child: Text(current == questions.length - 1 ? 'Submit' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
