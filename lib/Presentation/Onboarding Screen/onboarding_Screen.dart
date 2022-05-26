import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20page/RegOrsignPage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
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
      background: [
        LottieBuilder.asset(
          "Assets/onboarding/onboarding first.json",
          height: 45.h,
        ),
        LottieBuilder.asset(
          "Assets/onboarding/onboarding second.json",
          height: 45.h,
        ),
        LottieBuilder.asset(
          "Assets/onboarding/Onboarding third.json",
          height: 45.h,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        _customText(
          descriptionText:
              "Did you know what is the speciality of Reading a book",
        ),
        _customText(
            descriptionText: "They let you travel without moving your feet"),
        _customText(
            descriptionText: "Let us show you the way to the world of Books")
      ],
      onFinish: () => Navigator.pushReplacement(
          context,
          PageTransition(
            child: const RegOrSigninPage(),
            type: PageTransitionType.fade,
          )),
    );
  }
}






class _customText extends StatelessWidget {
  String descriptionText;
  _customText({
    required this.descriptionText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 57.h,
          ),
          GradientText(
            descriptionText,
            colors: const [
              Color.fromARGB(255, 86, 152, 205),
              Color.fromARGB(255, 0, 124, 225)
            ],
            gradientType: GradientType.linear,
            style: TextStyle(
              color: const Color.fromARGB(255, 5, 59, 103),
              fontSize: 18.0.sp,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
