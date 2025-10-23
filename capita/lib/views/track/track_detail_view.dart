import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/controllers/track_controller.dart';
import '../../core/models/module.dart';

class TrackDetailView extends StatelessWidget {
  const TrackDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final trackCtrl = Provider.of<TrackController>(context);
    final track = trackCtrl.selected;

    if (track == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Track')),
        body: const Center(child: Text('No track selected.')),
      );
    }

    final modules = track.modules..sort((a, b) => a.order.compareTo(b.order));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(track.title),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF38BDF8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Module m = modules[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
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
                        backgroundColor: const Color(0xFF4F46E5),
                        child: Text('${m.order}',
                            style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text(m.title,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(m.description),
                      trailing: m.locked
                          ? const Icon(Icons.lock, color: Colors.grey)
                          : const Icon(Icons.play_circle_fill_outlined,
                              color: Color(0xFF4F46E5)),
                      onTap: m.locked
                          ? null
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Opening: ${m.title}'),
                                ),
                              );
                            },
                    ),
                  );
                },
                childCount: modules.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
