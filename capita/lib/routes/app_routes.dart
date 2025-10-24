import 'package:flutter/material.dart';
import '../views/home/home_view.dart';
import '../views/track/track_list_view.dart';
import '../views/track/track_detail_view.dart';
import '../views/quiz/quiz_view.dart';
import '../views/leaderboard/leaderboard_view.dart';
import '../views/module/learning_module_view.dart';
import '../core/models/track.dart';

class AppRoutes {
  static const String home = '/';
  static const String trackList = '/tracks';
  static const String trackDetail = '/trackDetail';
  static const String quiz = '/quiz';
  static const String moduleDetail = '/module';
  static const String leaderboard = '/leaderboard';

  static Map<String, WidgetBuilder> get routes => {
    home: (_) => const HomeView(),
    trackList: (_) => const TrackListView(),
    trackDetail: (_) => const TrackDetailView(),
    moduleDetail: (_) => LearningModuleView(
      moduleTitle: "Sample Module",
      onComplete: () {
        print("Module completed!");
      },
    ),

    quiz: (_) => const QuizView(),
    leaderboard: (_) => const LeaderboardView(),
  };
}
