import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:readerclub/Presentation/Onboarding%20Screen/onboarding_Screen.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: LottieBuilder.asset("Assets/splash logo.json"),
      splashIconSize: 70.w,
      nextScreen: const OnboardingScreen(),
      duration: 3500,
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
