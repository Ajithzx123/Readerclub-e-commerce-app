import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20page/Login%20page/LoginPage.dart';
import 'package:readerclub/Presentation/First%20page/Reg%20or%20sign/RegOrsignPage.dart';
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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final PageController pageViewcontroller = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: SafeArea(
        
        child: Form(
          key: formKey,
          child: ListView(
              physics:
               const   ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:  EdgeInsets.all(2.0.w),
                    child: IconButton( icon: const Icon(Icons.arrow_back),onPressed: (){
                        Navigator.push(context, PageTransition(child:const RegOrSigninPage(), type: PageTransitionType.fade));
                    },),
                  )),
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
                    controller: pageViewcontroller,
                    children: [
                      CustomPageView(
                          firstvalidate: ((namevalue) {
                            if (namevalue.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          }),
                          secondvalidate: ((uservalue) {
                            if (uservalue.isEmpty) {
                              return 'Please enter Username';
                            }
                            return null;
                          }),
                          firstcontroller: nameController,
                          secondcontroller: usernameController,
                          textInputActionNext: TextInputAction.next,
                          textInputActionDone: TextInputAction.done,
                          hinttext1: "Name",
                          hinttext2: "Username",
                          lottie: "Assets/Register/register first.json"),
                      CustomPageView(
                          firstvalidate: ((mailvalue) {
                            if (mailvalue != null) {
                              if (mailvalue.length > 5 &&
                                  mailvalue.contains('@') &&
                                  mailvalue.endsWith('.com')) {
                                return null;
                              }
                              return 'Enter a Valid Email Address';
                            }
                          }),
                          secondvalidate: ((numbervalue) {
                            if (numbervalue.length != 10) {
                              return 'Mobile Number must be of 10 digit';
                            }
                            return null;
                          }),
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
                          firstvalidate: ((passwordvalue) {
                            if (passwordvalue.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (passwordvalue.length < 5) {
                              return ' password Must be more than 4 charater';
                            }
                          }),
                          secondvalidate: ((confirmvalue) {
                            if (confirmvalue != passwordController.text) {
                              return "please enter same password";
                            }
                            if (confirmvalue == null) {
                              return "please confirm password";
                            }
                          }),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(onPressed: (){
                              setState(() {
                                pageindex--;

                              });
                              pageViewcontroller.previousPage(duration: Duration(milliseconds: 700), curve: Curves.ease);
                            }, icon: Icon(Icons.arrow_back))),
                          
                          pageindex == 2
                              ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FadeInLeft(
                                    child: SizedBox(
                                      height: 10.h,
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            formKey.currentState!.validate();
                                            print(pageindex);
                                          },
                                          child: Container(
                                              width: 30.w,
                                              height: 6.h,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
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
                                ) : Align(
                                  alignment: Alignment.bottomRight,
                                  child: FadeInLeft(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          
                                          pageViewcontroller.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 700),
                                              curve: Curves.ease);
                                              pageindex++;
                                              print(pageindex);
                                        } else {
                                          return;
                                        }
      
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
                                ),
                        ],
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
                                    color: Colors.blue),
                                    recognizer: TapGestureRecognizer()..onTap = (() {
                                      Navigator.push(context, PageTransition(child: LoginPage(), type: PageTransitionType.fade));
                                    }))
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
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
            textinputaction: textInputActionDone,
          )),
        )
      ],
    );
  }
}
