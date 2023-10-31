import 'package:flutter/material.dart';
import 'package:salama_app/constant.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'event_card.dart';

class TimeLineTile11 extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final dynamic eventCardChild;
  const TimeLineTile11({super.key, required this.isFirst, required this.isLast, required this.isPast, required this.eventCardChild});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TimelineTile(
        endChild: EventCard(
          isPast: isPast,
          child: eventCardChild,
        ),
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: const LineStyle(color: backgroundColorDark),
        indicatorStyle: IndicatorStyle(
          width: 30,
          color: isPast? const Color.fromARGB(255, 211, 175, 65): const Color.fromARGB(255, 185, 177, 153),
          iconStyle: IconStyle(iconData: Icons.done,
          color: isPast? backgroundColorDark: const Color.fromARGB(255, 185, 177, 153),
            )
            ),
      ),
    );
  }
}
