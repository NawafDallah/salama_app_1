import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final Widget child;
  const EventCard({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: isPast? const EdgeInsets.all(15): const EdgeInsets.all(5),
      margin: isPast? const EdgeInsets.all(25): const EdgeInsets.all(35),
      decoration: BoxDecoration(
          color: isPast
              ? const Color.fromARGB(255, 211, 175, 65)
              : const Color.fromARGB(255, 185, 177, 153),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: child,
    );
  }
}
