import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

final backgroundgif = [
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
];

final insidetext = [
  Container(
    padding:  EdgeInsets.symmetric(horizontal: 4.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
         SizedBox(
          height: 57.h,
        ),
        GradientText(
          "Did you know what is the speciality of Reading a book",
          colors: const [
            Color.fromARGB(255, 86, 152, 205),
            Color.fromARGB(255, 0, 124, 225)
          ],
          gradientType: GradientType.linear,
          style:  TextStyle(
            color: Color.fromARGB(255, 5, 59, 103),
            fontSize: 18.0.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  ),
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
         SizedBox(
          height: 57.h,
        ),
        GradientText(
          "They let you travel without moving your feet",
          colors: const [
            Color.fromARGB(255, 86, 152, 205),
            Color.fromARGB(255, 0, 124, 225)
          ],
          gradientType: GradientType.linear,
          style:  TextStyle(
            color: Color.fromARGB(255, 5, 59, 103),
            fontSize: 18.0.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  ),
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           SizedBox(
            height: 57.h,
          ),
          GradientText(
            "Let us show you the way to the world of Books",
            colors: const [
              Color.fromARGB(255, 86, 152, 205),
              Color.fromARGB(255, 0, 124, 225)
            ],
            gradientType: GradientType.linear,
            style:  TextStyle(
              color: Color.fromARGB(255, 5, 59, 103),
              fontSize: 18.0.sp,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
  ),
];
