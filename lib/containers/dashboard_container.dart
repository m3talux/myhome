import 'package:flutter/material.dart';
import 'package:myhome/widgets/rooms_container.dart';
import 'package:myhome/widgets/summary_card.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 12),
        SummaryCard(),
        SizedBox(height: 12),
        RoomsWidget()
      ],
    );
  }
}
