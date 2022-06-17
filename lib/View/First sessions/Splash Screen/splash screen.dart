import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:readerclub/Controller/NavigationController.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final navcontroller = Get.put(NavigationController());

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
                delay: const Duration(seconds: 1),
                child: LottieBuilder.asset(
                  "Assets/splash logo.json",
                  height: 30.h,
                )),
            FadeIn(
              delay: const Duration(seconds: 1),
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
}
