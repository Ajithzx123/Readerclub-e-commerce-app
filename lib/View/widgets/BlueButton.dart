
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonBlue extends StatelessWidget {
  VoidCallback ontap;
  String title;
   ButtonBlue({
    required this.ontap,required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
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
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}