import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Lottie.asset("Assets/error.json"),
            Text(
              "OOPS!!",
              style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Something Went Wrong",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Text(
                "We are working on fixing the problem, Please refresh the page and try again.",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 6.h,
              width: 30.w,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Try Again"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black54),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0.w),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
