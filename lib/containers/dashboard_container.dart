import 'package:flutter/material.dart';
import 'package:myhome/widgets/clock_widget.dart';
import 'package:myhome/widgets/home_control.dart';
import 'package:myhome/widgets/summary_card.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 12),
          ClockWidget(),
          SizedBox(height: 12),
          SummaryCard(),
          SizedBox(height: 12),
          //HomeControl(),
        ],
      ),
    );
  }
}
