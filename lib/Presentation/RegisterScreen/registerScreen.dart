import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/Login%20page/LoginPage.dart';
import 'package:readerclub/Presentation/widgets/textfromWidget.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  int pageindex = 0;
  @override
  Widget build(BuildContext context) {
    final PageController PageViewcontroller = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        Center(
            child: Text(
          "Create New Account",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        )),
        SizedBox(
          height: 70.h,
          child: PageView(
            onPageChanged: (index) {
              pageindex = index;
            },
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: PageViewcontroller,
            children: [
              CustomPageView(
                  firstcontroller: nameController,
                  secondcontroller: usernameController,
                  textInputActionNext: TextInputAction.next,
                  textInputActionDone: TextInputAction.done,
                  hinttext1: "Name",
                  hinttext2: "Username",
                  lottie: "Assets/Register/register first.json"),
              CustomPageView(
                  firstcontroller: emailController,
                  secondcontroller: phoneController,
                  hinttext1: "Email",
                  textInputActionNext: TextInputAction.next,
                  textInputActionDone: TextInputAction.done,
                  textinputtype: TextInputType.emailAddress,
                  textinputtypeNumber: TextInputType.number,
                  hinttext2: "Phone Number",
                  lottie: "Assets/Register/register second.json"),
              CustomPageView(
                  firstcontroller: passwordController,
                  secondcontroller: confirmPasswordController,
                  obscure: true,
                  textInputActionNext: TextInputAction.next,
                  textInputActionDone: TextInputAction.done,
                  hinttext1: "Password",
                  hinttext2: "Confirm Password",
                  lottie: "Assets/Register/register third.json")
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          child: Column(
            children: [
              pageindex != 1
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: FadeInLeft(
                        child: GestureDetector(
                          onTap: () {
                            PageViewcontroller.nextPage(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.ease);
                            setState(() {});
                          },
                          child: Container(
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
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 13.sp,
                              )),
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: FadeInLeft(
                        child: SizedBox(
                          height: 10.h,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                               
                              },
                              child: Container(
                                  width: 30.w,
                                  height: 6.h,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(166, 210, 255, 1),
                                      Color.fromARGB(255, 0, 139, 225)
                                    ]),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp),
                                  ))),
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 2.h,
              ),
              Align(
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
                            color: Colors.blue))
                  ]),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class CustomPageView extends StatelessWidget {
  final TextEditingController firstcontroller;
  final TextEditingController secondcontroller;
  final String hinttext1;
  final String hinttext2;
  final String lottie;
  final bool? obscure;
  final TextInputType? textinputtypeNumber;
  final TextInputType? textinputtype;
  final TextInputAction textInputActionNext;
  final TextInputAction textInputActionDone;

  const CustomPageView({
    Key? key,
    this.textinputtypeNumber,
    this.obscure,
    this.textinputtype,
    required this.textInputActionDone,
    required this.textInputActionNext,
    required this.firstcontroller,
    required this.secondcontroller,
    required this.hinttext1,
    required this.hinttext2,
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
              textinputtype: textinputtype,
              obscure: obscure,
              controller: firstcontroller,
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
            textinputtype: textinputtypeNumber,
            obscure: obscure,
            controller: secondcontroller,
            hinttext: hinttext2,
            textinputaction: textInputActionDone,
          )),
        )
      ],
    );
  }
}
