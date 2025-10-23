import 'module.dart';

class Track {
  final String id;
  final String title;
  final String subtitle;
  final String icon; // asset path or icon name
  final List<Module> modules;

  Track({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.modules,
  });
}
