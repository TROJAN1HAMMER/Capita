class Module {
  final String id;
  final String title;
  final String description;
  final int order;
  final Duration estimatedTime; // e.g. 10 minutes
  final bool locked;
  final List<String> questions;

  Module({
    required this.id,
    required this.title,
    required this.description,
    this.order = 0,
    this.estimatedTime = const Duration(minutes: 10),
    this.locked = false,
    this.questions = const [],
  });
}
