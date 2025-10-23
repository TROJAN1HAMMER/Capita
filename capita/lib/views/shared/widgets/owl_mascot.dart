import 'package:flutter/material.dart';

class OwlMascot extends StatefulWidget {
  final double size;
  final bool wave;
  const OwlMascot({super.key, this.size = 120, this.wave = false});

  @override
  State<OwlMascot> createState() => _OwlMascotState();
}

class _OwlMascotState extends State<OwlMascot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: -0.02, end: 0.02).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      )),
      child: Image.asset(
        'assets/icons/owl.png',
        height: widget.size,
        width: widget.size,
      ),
    );
  }
}
