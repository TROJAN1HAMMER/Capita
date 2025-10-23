import '../models/track.dart';
import '../models/module.dart';

class LocalDataService {
  final List<Track> _tracks = [];

  Future<void> loadMockData() async {
    // This simulates reading from local JSON or embedded SRS content.
    _tracks.clear();

    _tracks.add(
      Track(
        id: 'track_personal',
        title: 'Personal Finance',
        subtitle: 'Money, budgeting, investing, personal planning',
        icon: 'assets/icons/personal.png',
        modules: [
          Module(
            id: 'pf_m1',
            title: 'Money & Banking Basics',
            description: 'Cash, digital, UPI, banking system in India.',
            order: 1,
            estimatedTime: const Duration(minutes: 12),
          ),
          Module(
            id: 'pf_m2',
            title: 'Budgeting & Savings',
            description: '50-30-20, emergency funds, expense tracking.',
            order: 2,
          ),
          // add remaining modules...
        ],
      ),
    );

    _tracks.add(
      Track(
        id: 'track_corporate',
        title: 'Corporate Finance',
        subtitle: 'Corporate finance fundamentals',
        icon: 'assets/icons/corporate.png',
        modules: [
          Module(
            id: 'cf_m1',
            title: 'Introduction to Corporate Finance',
            description: 'Goal: maximizing shareholder wealth...',
            order: 1,
          ),
          // add more
        ],
      ),
    );

    // add other tracks similarly — you can generate all 8 tracks from SRS
    await Future.delayed(const Duration(milliseconds: 300));
  }

  List<Track> getAllTracks() => List.unmodifiable(_tracks);
}
