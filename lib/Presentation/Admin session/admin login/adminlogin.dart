import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20sessions/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:readerclub/Presentation/widgets/textfromWidget.dart';
import 'package:sizer/sizer.dart';

import '../../User session/Login page/LoginPage.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(2.0.w),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const RegOrSigninPage(),
                            type: PageTransitionType.fade));
                  },
                ),
              )),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FadeInLeft(
                    child: LottieBuilder.asset(
                      "Assets/login/ideabook.json",
                      height: 30.h,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                FadeInRight(
                  child: Text(
                    "Welcome Back",
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                FadeInRight(
                  child: Text(
                    "Sign In as Admin",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 4.h),
                FadeInLeft(
                  child: CustomText(
                      validator: ((uservalue) {
                        if (uservalue.isEmpty) {
                          return 'Please enter Username';
                        }
                        return null;
                      }),
                      textinputaction: TextInputAction.next,
                      textinputtype: TextInputType.name,
                      obscure: false,
                      controller: usernameController,
                      hinttext: "Username"),
                ),
                SizedBox(height: 2.h),
                FadeInRight(
                  child: CustomText(
                      validator: ((passwordvalue) {
                        if (passwordvalue.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (passwordvalue.length < 5) {
                          return ' password Must be more than 4 charater';
                        }
                      }),
                      textinputaction: TextInputAction.done,
                      textinputtype: TextInputType.name,
                      obscure: true,
                      controller: passwordController,
                      hinttext: "Password"),
                ),
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.topRight,
                  child: FadeInRight(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Center(
                  child: FadeInLeft(
                    child: const _CustombuttonLogin(),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: FadeInDown(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Sign In as ",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                        TextSpan(
                            text: "User",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: LoginPage(),
                                        type: PageTransitionType.fade));
                              })
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class _CustombuttonLogin extends StatelessWidget {
  const _CustombuttonLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(166, 210, 255, 1),
            Color.fromARGB(255, 0, 139, 225)
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
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
