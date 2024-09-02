import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myhome/containers/dashboard_container.dart';
import 'package:myhome/stores/stores.dart';
import 'package:myhome/widgets/my_bottom_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const DashboardContainer(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Observer(builder: (_) => _pages[navigationStore.homeRoute]),
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
