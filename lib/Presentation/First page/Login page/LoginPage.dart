import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20page/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:readerclub/Presentation/First%20page/RegisterScreen/registerScreen.dart';
import 'package:readerclub/Presentation/widgets/textfromWidget.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton( icon: const Icon(Icons.arrow_back),onPressed: (){
                        Navigator.push(context, PageTransition(child:const RegOrSigninPage(), type: PageTransitionType.fade));
                    },)),
                Center(
                  child: FadeInLeft(
                    child: LottieBuilder.asset(
                      "Assets/login/ideabook.json",
                      height: 25.h,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                FadeInRight(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
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
                      controller: usernamecontroller,
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
                      controller: passwordcontroller,
                      hinttext: "Password"),
                ),
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.topRight,
                  child: FadeInRight(
                    child: Text(
                      "Forgot Password",
                      style:
                          TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: FadeInLeft(
                    child: _CustombuttonLogin(
                      iconcolor: Colors.white,
                      cusIcons: Icons.login,
                      textcolor: Colors.white,
                      width: 35.w,
                      text: "Sign In",
                      onpressed: () {},
                      colours: const [
                        Color.fromRGBO(166, 210, 255, 1),
                        Color.fromARGB(255, 0, 139, 225)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Center(
                    child: FadeInLeft(
                      child: Text(
                                    "OR",
                                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                                  ),
                    )),
                SizedBox(height: 2.h),
                Center(
                  child: FadeInRight(
                    child: _CustombuttonLogin(
                        cusIcons: Icons.phone_iphone,
                        iconcolor: Colors.black,
                        textcolor: Colors.black,
                        width: 70.w,
                        text: "Sign In with Phone Number",
                        onpressed: () {},
                        colours: const [
                          Color.fromARGB(255, 222, 222, 222),
                          Color.fromARGB(255, 227, 227, 227)
                        ]),
                  ),
                ),
                SizedBox(height: 6.h),
                Center(
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
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.push(context, PageTransition(child: RegisterScreen(), type: PageTransitionType.fade));
                                }
                                )
                      
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustombuttonLogin extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final List<Color> colours;
  final double width;
  final Color textcolor;
  final Color iconcolor;

  final IconData? cusIcons;
  const _CustombuttonLogin({
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
        onPressed: () {},
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