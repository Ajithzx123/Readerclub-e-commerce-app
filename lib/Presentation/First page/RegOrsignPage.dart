import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class RegOrSigninPage extends StatelessWidget {
  const RegOrSigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Text(
              "ReaderClub",
              style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w900),
            ),
            Text(
              "welcomes you",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 11.h,
            ),
            Stack(
              children: [
                Lottie.asset(
                  "Assets/regOrsignPage/firstpageRegOrSign.json",
                ),
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInLeft(
                    child: _CustomButton(onPressed: () {}, text: 'Register'),
                  ),
                  FadeInRight(
                      child: _CustomButton(onPressed: () {}, text: 'Sign In'))
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Login as ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "Admin",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ])),
            )
          ],
        ),
      )),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const _CustomButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33.w,
      height: 7.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(166, 210, 255, 1),
                Color.fromARGB(255, 0, 139, 225)
              ])),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
    );
  }
}
