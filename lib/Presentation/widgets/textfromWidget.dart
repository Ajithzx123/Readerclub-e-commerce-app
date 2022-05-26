
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.textinputaction,
    required this.textinputtype,
    required this.obscure,
    required this.controller,
    required this.hinttext,
  }) : super(key: key);

  final TextInputType? textinputtype;
  final bool? obscure;
  final TextEditingController controller;
  final String hinttext;
  final TextInputAction textinputaction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textinputtype,
      obscureText: obscure ?? false,
      controller: controller,
      textInputAction: textinputaction,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 12.sp),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: .3.w),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: .3.w),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}