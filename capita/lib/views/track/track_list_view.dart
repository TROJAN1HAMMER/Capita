import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/controllers/track_controller.dart';
import '../../routes/app_routes.dart';
import '../shared/widgets/card_tile.dart';
import '../shared/widgets/gradient_background.dart';

class TrackListView extends StatelessWidget {
  const TrackListView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackCtrl = Provider.of<TrackController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Learning Tracks'),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            itemCount: trackCtrl.tracks.length,
            itemBuilder: (context, index) {
              final t = trackCtrl.tracks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
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
    );
  }
}
