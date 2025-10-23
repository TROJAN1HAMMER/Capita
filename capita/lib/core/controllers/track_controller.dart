import 'package:flutter/material.dart';
import '../models/track.dart';
import '../services/local_data_service.dart';

class TrackController extends ChangeNotifier {
  final LocalDataService _dataService;

  TrackController(this._dataService) {
    _tracks = _dataService.getAllTracks();
  }

  late List<Track> _tracks;
  Track? _selected;

  List<Track> get tracks => _tracks;
  Track? get selected => _selected;

  void selectTrack(String id) {
    _selected = _tracks.firstWhere((t) => t.id == id, orElse: () => _tracks.first);
    notifyListeners();
  }

  void clearSelection() {
    _selected = null;
    notifyListeners();
  }

  // For future: methods to update progress, mark module complete, XP add, etc.
}
