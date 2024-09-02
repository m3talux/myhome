import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:myhome/stores/stores.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0, -2), color: Colors.black12, blurRadius: 4)
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyBottomBarItem(
            icon: Icons.dashboard_outlined,
            index: 0,
          ),
          MyBottomBarItem(
            icon: Icons.settings,
            index: 1,
          ),
        ],
      ),
    );
  }
}

class MyBottomBarItem extends StatelessWidget {
  const MyBottomBarItem({super.key, required this.icon, required this.index});

  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigationStore.setHomeRoute(index),
      child: Observer(
        builder: (_) => navigationStore.homeRoute == index
            ? GradientIcon(
                icon: icon,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.purple, Colors.red],
                ),
                offset: const Offset(0, 0),
              )
            : Icon(icon),
      ),
    );
  }
}
