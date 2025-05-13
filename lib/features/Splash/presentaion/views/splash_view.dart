import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/Splash/presentaion/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.primaryColor,
      body: SplashViewBody(),
    );
  }
}
