import 'package:flutter/material.dart';
import '../../core/services/progress_service.dart';
import '../../core/models/module.dart';

class LearningModuleView extends StatefulWidget {
  final String moduleTitle; // ✅ Add this
  final VoidCallback onComplete; // ✅ Add this

  const LearningModuleView({
    super.key,
    required this.moduleTitle,
    required this.onComplete,
  });

  @override
  State<LearningModuleView> createState() => _LearningModuleViewState();
}

class _LearningModuleViewState extends State<LearningModuleView> {
  final progressService = ProgressService();
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    _checkStatus(widget.moduleTitle);
  }

  Future<void> _checkStatus(String id) async {
    final done = await progressService.isModuleDone(id);
    setState(() => isDone = done);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.moduleTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              _getModuleDescription(widget.moduleTitle),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            const Text(
              "💡 Learning Summary:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              "Learn about key financial concepts like budgeting, saving, "
              "investing, and understanding how money flows in the economy.",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.check_circle),
              label: Text(isDone ? "Marked as Done " : "Mark as Done"),
              onPressed: isDone
                  ? null
                  : () async {
                      await progressService.markModuleDone(widget.moduleTitle);
                      widget.onComplete(); // ✅ Notify parent (TrackDetailView)
                      setState(() => isDone = true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Module marked as done!")),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }

  // Optional helper for dummy descriptions
  String _getModuleDescription(String title) {
    switch (title) {
      case 'Budgeting Basics':
        return 'Learn how to create, manage, and optimize your personal budget.';
      case 'Saving and Investing':
        return 'Understand savings goals, emergency funds, and beginner investing strategies.';
      case 'Credit & Loans':
        return 'Explore credit scores, loans, and how to borrow responsibly.';
      case 'Financial Planning':
        return 'Build long-term plans for retirement, insurance, and big expenses.';
      case 'Understanding Taxes':
        return 'Learn the fundamentals of income tax, deductions, and filing efficiently.';
      default:
        return 'Learn core financial skills to help you make smarter money decisions.';
    }
  }
}
