import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:readerclub/Presentation/widgets/textfromWidget.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: LottieBuilder.asset(
                "Assets/login/ideabook.json",
                height: 25.h,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 4.h),
            CustomText(
                textinputaction: TextInputAction.next,
                textinputtype: TextInputType.name,
                obscure: false,
                controller: usernamecontroller,
                hinttext: "Username"),
            SizedBox(height: 2.h),
            CustomText(
                textinputaction: TextInputAction.done,
                textinputtype: TextInputType.name,
                obscure: true,
                controller: usernamecontroller,
                hinttext: "Password"),
            SizedBox(height: 1.h),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Forgot Password",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5.h),
            Center(
              child: _CustombuttonLogin(
                cusIcons: Icons.login,
                textcolor: Colors.white,
                width: 50.w,
                text: "Sign In",
                onpressed: () {},
                colours: const [
                  Color.fromRGBO(166, 210, 255, 1),
                  Color.fromARGB(255, 0, 139, 225)
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Center(
                child: Text(
              "OR",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            )),
            SizedBox(height: 3.h),
            Center(
              child: _CustombuttonLogin(
                cusIcons: Icons.phone,
                  textcolor: Colors.black,
                  width: 70.w,
                  text: "Sign In with Phone Number",
                  onpressed: () {},
                  colours: const [
                    Color.fromARGB(255, 222, 222, 222),
                    Color.fromARGB(255, 227, 227, 227)
                  ]),
            )
          ],
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
  final IconData? cusIcons;
  const _CustombuttonLogin({
    Key? key,
    this.cusIcons,
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

            Icon(cusIcons,color: Colors.black,),

            Expanded(
              child: Text(
                text,textAlign: TextAlign.center,
                style: TextStyle(
                    color: textcolor, fontWeight: FontWeight.bold, fontSize: 13.sp),
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
