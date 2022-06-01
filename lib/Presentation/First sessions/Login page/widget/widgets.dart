import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../RegisterScreen/registerScreen.dart';

class RegisterDontHaveAccount extends StatelessWidget {
  const RegisterDontHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInDown(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "Dont have any Account ? ",
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            TextSpan(
                text: "Register",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: RegisterScreen(),
                            type: PageTransitionType.fade));
                  })
          ]),
        ),
      ),
    );
  }
}

class CustombuttonLogin extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final List<Color> colours;
  final double width;
  final Color textcolor;
  final Color iconcolor;

  final IconData? cusIcons;
  const CustombuttonLogin({
    Key? key,
    this.cusIcons,
    required this.iconcolor,
    required this.textcolor,
    required this.width,
    required this.text,
    required this.onpressed,
    required this.colours,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colours,
        ),
      ),
      child: ElevatedButton(
        onPressed: onpressed,
        child: Row(
          children: [
            Icon(
              cusIcons,
              color: iconcolor,
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp),
              ),
            ),
          ],
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
