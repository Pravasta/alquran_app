import 'package:flutter/material.dart';
import '../view/section/splash_view.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashView(),
    );
  }
}
