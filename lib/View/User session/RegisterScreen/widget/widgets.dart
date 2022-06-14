import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:sizer/sizer.dart';

import '../../../widgets/textfromWidget.dart';

class CustomPageView extends StatelessWidget {
  final TextEditingController firstcontroller;
  final TextEditingController secondcontroller;
  final String hinttext1;
  final String hinttext2;
  final String labeltext1;
  final String labeltext2;
  final String lottie;
  final bool? obscure;
  final FormFieldValidator firstvalidate;
  final FormFieldValidator secondvalidate;
  final TextInputType? textinputtypeNumber;
  final TextInputType? textinputtype;
  final TextInputAction textInputActionNext;
  final TextInputAction textInputActionDone;

  CustomPageView({
    Key? key,
    this.textinputtypeNumber,
    this.obscure,
    this.textinputtype,
    required this.firstvalidate,
    required this.secondvalidate,
    required this.textInputActionDone,
    required this.textInputActionNext,
    required this.firstcontroller,
    required this.secondcontroller,
    required this.hinttext1,
    required this.hinttext2,
    required this.labeltext1,
    required this.labeltext2,
    required this.lottie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInRight(child: LottieBuilder.asset(lottie)),
        Padding(
          padding: EdgeInsets.only(left: 13.w, right: 13.w),
          child: FadeInLeft(
            child: CustomText(
              validator: firstvalidate,
              textinputtype: textinputtype,
              obscure: obscure,
              controller: firstcontroller,
              labeltext: labeltext1,
              
              hinttext: hinttext1,
              textinputaction: textInputActionNext,
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 13.w, right: 13.w),
          child: FadeInRight(
              child: CustomText(
            validator: secondvalidate,
            textinputtype: textinputtypeNumber,
            obscure: obscure,
            controller: secondcontroller,
            hinttext: hinttext2,
            labeltext: labeltext2,
            textinputaction: textInputActionDone,
          )),
        )
      ],
    );
  }
}

class PageViewNextButton extends StatelessWidget {
  IconData icon;
   PageViewNextButton({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 15.w,
        height: 10.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(166, 210, 255, 1),
            Color.fromARGB(255, 0, 139, 225)
          ]),
          shape: BoxShape.circle,
        ),
        child: Icon(
         icon,
          color: Colors.white,
          size: 13.sp,
        ));
  }
}



class SignInAlreadyAccount extends StatelessWidget {
  const SignInAlreadyAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Already have an Account? ",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          TextSpan(
              text: "Sign In",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = (() {
                //  context.read<NavblocBloc>().add(NavToSignInScreenEvent());
                }))
        ]),
      ),
    );
  }
}
