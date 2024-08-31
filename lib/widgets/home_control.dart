import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeControl extends StatelessWidget {
  const HomeControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/home.svg',
          width: 56,
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          'assets/svg/light_on.svg',
          width: 24,
        ),
        const SizedBox(width: 24),
        Container(
          
        )
      ],
    );
  }
}
