import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20page/RegOrsignPage.dart';
import 'package:readerclub/Presentation/Onboarding%20Screen/widgets.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      finishButtonText: "Lets Begin",
      finishButtonTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
      ),
      pageBackgroundColor: Colors.white,
      controllerColor: Colors.black,
      addController: true,
      addButton: true,
      imageVerticalOffset: 8.h,
      skipTextButton: const Text(
        "Skip",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
      background: backgroundgif,
      speed: 1.8,
      pageBodies: insidetext,
      onFinish: () => Navigator.pushReplacement(
          context,
          PageTransition(
            child: const RegOrSigninPage(),
            type: PageTransitionType.fade,
          )),
    );
  }
}
