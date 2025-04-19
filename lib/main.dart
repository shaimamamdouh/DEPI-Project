import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readio/features/Splash/presentaion/views/splash_view.dart';

void main() {
  runApp(const Readio());
}

class Readio extends StatelessWidget {
  const Readio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
