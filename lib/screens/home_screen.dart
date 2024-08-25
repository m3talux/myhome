import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myhome/containers/lights_container.dart';
import 'package:myhome/router/router.dart';
import 'package:myhome/router/router.gr.dart';
import 'package:myhome/stores/stores.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const LightsContainer(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();

    navigationStore.pageController =
        PageController(initialPage: navigationStore.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Observer(
          builder: (_) => lightStore.multiSelectionMode
              ? IconButton(
                  onPressed: () => lightStore.clearSelectedLights(),
                  icon: const Icon(Icons.close),
                )
              : Container(),
        ),
        title: Observer(
            builder: (_) => Text(navigationStore.homeRoute == 0
                ? lightStore.multiSelectionMode
                    ? 'Selected (${lightStore.selectedLights.length})'
                    : 'Lights'
                : 'Shades')),
        actions: [
          Observer(
            builder: (_) => lightStore.selectedLights.length == 1
                ? IconButton(
                    onPressed: () => router.push(
                      LightRoute(light: lightStore.selectedLights[0]),
                    ),
                    icon: const Icon(Icons.edit),
                  )
                : Container(),
          ),
          Observer(
            builder: (_) => lightStore.selectedLights.length > 1
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  )
                : Container(),
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.black54,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => router.push(LightRoute()),
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple, Colors.red],
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        controller: navigationStore.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(_pages.length, (index) => _pages[index]),
      ),
      bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          notchMargin: 5,
          elevation: 24.0,
          shadowColor: Colors.black54,
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Observer(
                  builder: (_) => Icon(
                    Icons.lightbulb_outline,
                    color: navigationStore.homeRoute == 0
                        ? Colors.blue
                        : Colors.black54,
                  ),
                ),
                onPressed: () => navigationStore.setHomeRoute(0),
              ),
              IconButton(
                icon: Observer(
                  builder: (_) => Icon(
                    Icons.roller_shades,
                    color: navigationStore.homeRoute == 1
                        ? Colors.blue
                        : Colors.black54,
                  ),
                ),
                onPressed: () => navigationStore.setHomeRoute(1),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    socketStore.disconnect();
    navigationStore.pageController.dispose();

    super.dispose();
  }
}
