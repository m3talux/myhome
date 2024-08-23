import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:myhome/stores/stores.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _kGradients = [Colors.blue, Colors.purple, Colors.red];

  @override
  void initState() {
    super.initState();

    appStore.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientText(
              'MyHome +',
              colors: _kGradients,
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
              width: 80,
              height: 80,
              child: LoadingIndicator(
                indicatorType: Indicator.ballClipRotatePulse,
                colors: [Colors.purple, Colors.blue, Colors.red],
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
