import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20sessions/Onboarding%20Screen/onboarding_Screen.dart';
import 'package:readerclub/Presentation/First%20sessions/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:readerclub/Presentation/User%20session/home%20screen/homescreen.dart';
import 'package:readerclub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getdata() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final value = sharedPreferences.getBool(savedKey);
    final onboardvalue = sharedPreferences.getBool(onboardKey);
    if (value == true) {
      navtomain();
    } else if( onboardvalue == false){
navtoOnboard();
    }
    
    
     else {
      navtoREgOrSign();
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            FadeIn(
              delay: Duration(seconds: 1),
              child: LottieBuilder.asset("Assets/splash logo.json",height: 30.h,)),
            FadeIn(
              delay: Duration(seconds: 1),
              child: GradientText(
                "R E A D E R   C L U B",
                colors: const [
                  Color.fromARGB(255, 160, 123, 173),
                  Color.fromARGB(255, 24, 79, 124)
                ],
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25.sp),
              ),
            )
        ],
      ),
          )),
    );
  }

  Future navtomain() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(child: const HomeScreen(), type: PageTransitionType.fade),
          (route) => false);
    });
  }

  Future navtoREgOrSign() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              child: const RegOrSigninPage(), type: PageTransitionType.fade),
          (route) => false);
    });
  }
   Future navtoOnboard() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              child: const OnboardingScreen(), type: PageTransitionType.fade),
          (route) => false);
    });
}
}