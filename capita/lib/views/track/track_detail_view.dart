import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../quiz/quiz_view.dart';
import '../leaderboard/leaderboard_view.dart';
import '../module/learning_module_view.dart';

class TrackDetailView extends StatefulWidget {
  const TrackDetailView({super.key});

  @override
  State<TrackDetailView> createState() => _TrackDetailViewState();
}

class _TrackDetailViewState extends State<TrackDetailView> {
  final List<String> modules = [
    'Budgeting Basics',
    'Saving and Investing',
    'Credit & Loans',
    'Financial Planning',
    'Understanding Taxes',
  ];

  List<bool> completed = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('completedModules') ?? [];
    setState(() {
      completed = List.generate(
        modules.length,
        (i) => saved.contains(modules[i]),
      );
      isLoading = false;
    });
  }

  Future<void> markDone(String moduleTitle) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('completedModules') ?? [];
    if (!saved.contains(moduleTitle)) {
      saved.add(moduleTitle);
      await prefs.setStringList('completedModules', saved);
      loadProgress();
    }
  }

  int get completedCount => completed.where((e) => e).length;
  bool get allDone => completedCount == modules.length;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Progress"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Financial Foundations",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: completedCount / modules.length,
                  backgroundColor: Colors.grey[300],
                  color: Colors.green,
                  minHeight: 8,
                ),
                const SizedBox(height: 8),
                Text("${completedCount}/${modules.length} modules completed"),
              ],
            ),
            const SizedBox(height: 20),

            // Module list
            Expanded(
              child: ListView.builder(
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: completed[index] ? Colors.green[50] : null,
                    child: ListTile(
                      title: Text(modules[index]),
                      trailing: completed[index]
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.radio_button_unchecked),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LearningModuleView(
                              moduleTitle: modules[index],
                              onComplete: () => markDone(modules[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Quiz + Leaderboard
            Column(
              children: [
                ElevatedButton(
                  onPressed: allDone
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const QuizView()),
                        )
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: allDone ? Colors.blueAccent : Colors.grey,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: Text(
                    allDone ? "Start Quiz" : "Complete all modules to unlock",
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LeaderboardView(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text("View Leaderboard"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
