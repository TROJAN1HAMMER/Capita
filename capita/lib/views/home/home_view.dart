import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/controllers/track_controller.dart';
import '../shared/widgets/card_tile.dart';
import '../../routes/app_routes.dart';
import '../shared/widgets/owl_mascot.dart';
import '../../core/constants/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackCtrl = Provider.of<TrackController>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 280,
            decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi Learner 👋',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            'Ready to grow your finance skills?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                      const OwlMascot(size: 80),
                    ],
                  ),
                  const SizedBox(height: 24),
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
                                Navigator.pushNamed(
                                    context, AppRoutes.trackDetail);
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
        ],
      ),
    );
  }
}
