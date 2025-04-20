import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/start_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<Offset>(
      begin: Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    animation.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        () => const StartView(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 800),
      );
    });
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 150, width: 250, child: Image.asset(AssetsData.logo)),
        SlideTransition(
          position: animation,
          child: Text(
            'Read. Listen. Discuss.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Color(0xffFEF5E4)),
          ),
        ),
      ],
    );
  }
}
