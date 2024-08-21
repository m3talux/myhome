import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:myhome/containers/debug_container.dart';
import 'package:myhome/containers/lights_container.dart';
import 'package:myhome/stores/stores.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);

  final _controller = NotchBottomBarController(index: 0);

  final _items = [
    const BottomBarItem(
      inActiveItem: Icon(
        Icons.lightbulb,
        color: Colors.grey,
      ),
      activeItem: Icon(
        Icons.lightbulb,
        color: Colors.blue,
      ),
    ),
    const BottomBarItem(
      inActiveItem: Icon(
        Icons.add,
        color: Colors.grey,
      ),
      activeItem: Icon(
        Icons.add,
        color: Colors.blue,
      ),
    ),
    const BottomBarItem(
      inActiveItem: Icon(
        Icons.roller_shades,
        color: Colors.grey,
      ),
      activeItem: Icon(
        Icons.roller_shades,
        color: Colors.blue,
      ),
    )
  ];

  final List<Widget> _pages = [
    const LightsContainer(),
    const DebugContainer(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();

    socketStore.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(_pages.length, (index) => _pages[index]),
        ),
      ),
      extendBody: false,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        bottomBarItems: _items,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
        kBottomRadius: 12.0,
      ),
    );
  }
}
