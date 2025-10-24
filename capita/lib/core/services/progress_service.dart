import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static const _completedModulesKey = 'completed_modules';
  static const _quizScoreKey = 'quiz_score';

  Future<List<String>> getCompletedModules() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_completedModulesKey) ?? [];
  }

  Future<void> markModuleDone(String moduleId) async {
    final prefs = await SharedPreferences.getInstance();
    final completed = prefs.getStringList(_completedModulesKey) ?? [];
    if (!completed.contains(moduleId)) {
      completed.add(moduleId);
      await prefs.setStringList(_completedModulesKey, completed);
    }
  }

  Future<bool> isModuleDone(String moduleId) async {
    final completed = await getCompletedModules();
    return completed.contains(moduleId);
  }

  Future<void> saveQuizScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_quizScoreKey, score);
  }

  Future<int> getQuizScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_quizScoreKey) ?? 0;
  }
}
