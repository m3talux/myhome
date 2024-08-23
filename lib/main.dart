import 'package:flutter/material.dart';
import 'package:myhome/router/router.dart';

void main() {
  runApp(const MyHomeApp());
}

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyHome +',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      routerConfig: router.config(),
    );
  }
}
