import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 150, width: 250, child: Image.asset(AssetsData.logo)),
      ],
    );
  }
}
