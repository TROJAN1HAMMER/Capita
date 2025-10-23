import 'package:flutter/material.dart';
import '../views/home/home_view.dart';
import '../views/track/track_list_view.dart';
import '../views/track/track_detail_view.dart';
import '../core/models/track.dart';

class AppRoutes {
  static const String home = '/';
  static const String trackList = '/tracks';
  static const String trackDetail = '/trackDetail';

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const HomeView(),
        trackList: (_) => const TrackListView(),
        trackDetail: (_) => const TrackDetailView(),
      };
}
