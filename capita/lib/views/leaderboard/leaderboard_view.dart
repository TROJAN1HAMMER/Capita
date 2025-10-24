import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/services/progress_service.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({super.key});

  @override
  State<LeaderboardView> createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView>
    with SingleTickerProviderStateMixin {
  final progressService = ProgressService();
  int score = 0;

  final List<Map<String, dynamic>> dummyLeaderboard = [
    {'name': 'Aarav', 'score': 9},
    {'name': 'Isha', 'score': 7},
    {'name': 'Noel', 'score': 5},
  ];

  @override
  void initState() {
    super.initState();
    _loadScore();
  }

  Future<void> _loadScore() async {
    final userScore = await progressService.getQuizScore();
    setState(() => score = userScore);
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 0:
        return const Color(0xFFFFD700); // gold
      case 1:
        return const Color(0xFFC0C0C0); // silver
      case 2:
        return const Color(0xFFCD7F32); // bronze
      default:
        return Colors.blueGrey.shade100;
    }
  }

  IconData _getRankIcon(int rank) {
    switch (rank) {
      case 0:
        return Icons.emoji_events;
      case 1:
        return Icons.emoji_events_outlined;
      case 2:
        return Icons.military_tech;
      default:
        return Icons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fullList = [
      ...dummyLeaderboard,
      {'name': 'You', 'score': score},
    ]..sort((a, b) => b['score'].compareTo(a['score']));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: Colors.indigo.shade600,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade50, Colors.indigo.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: fullList.length,
          itemBuilder: (context, i) {
            final entry = fullList[i];
            final isUser = entry['name'] == 'You';
            final color = _getRankColor(i);

            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: color,
                  child: Icon(_getRankIcon(i), color: Colors.white),
                ),
                title: Text(
                  entry['name'],
                  style: GoogleFonts.poppins(
                    fontWeight: isUser ? FontWeight.bold : FontWeight.w500,
                    color: isUser ? Colors.indigo.shade700 : Colors.black87,
                  ),
                ),
                trailing: Text(
                  '${entry['score']} pts',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo.shade600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
