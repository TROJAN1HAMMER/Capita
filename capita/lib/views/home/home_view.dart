import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/controllers/track_controller.dart';
import '../shared/widgets/card_tile.dart';
import '../../routes/app_routes.dart';
import '../shared/widgets/owl_mascot.dart';
import '../../core/constants/app_colors.dart';
import '../shared/widgets/gradient_background.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackCtrl = Provider.of<TrackController>(context);

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with title, subtitle, actions aligned neatly
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi Learner 👋',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Ready to grow your finance skills?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      tooltip: 'Profile & Settings',
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.profile),
                    ),
                    const SizedBox(width: 8),
                    const OwlMascot(size: 64),
                  ],
                ),
                const SizedBox(height: 20),
                // Content card area with proper spacing
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ListView.builder(
                      itemCount: trackCtrl.tracks.length,
                      itemBuilder: (context, index) {
                        final t = trackCtrl.tracks[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CardTile(
                            title: t.title,
                            subtitle: t.subtitle,
                            assetIcon: t.icon,
                            onTap: () {
                              trackCtrl.selectTrack(t.id);
                              Navigator.pushNamed(context, AppRoutes.trackDetail);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
