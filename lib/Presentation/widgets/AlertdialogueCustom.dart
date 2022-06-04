
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AlertPopUp extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback leftontap;
  final VoidCallback rightontap;
  final String leftButton;
  final String rightbutton;
   
  const AlertPopUp({
    Key? key, required this.title, required this.description, required this.leftontap, required this.rightontap, required this.leftButton, required this.rightbutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title:  Center(child: Text(title)),
        
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontSize: 17.sp),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(10.w))),
        content: SizedBox(
          height: 10.h,
          child: Column(
            children: [
              Text(description,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),),
              Padding(
                padding:  EdgeInsets.all(3.w),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    confirmButtons(ontap: leftontap, leftButton: leftButton),
                    confirmButtons(ontap: rightontap, leftButton: rightbutton)
                  
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class confirmButtons extends StatelessWidget {
  const confirmButtons({
    Key? key,
    required this.ontap,
    required this.leftButton,
  }) : super(key: key);

  final VoidCallback ontap;
  final String leftButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      width: 10.h,
      child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            shape:  RoundedRectangleBorder(
              borderRadius:
                   BorderRadius.circular(
                      30.0),
            ),
          ),
          child:  Text(leftButton,style: TextStyle(fontWeight: FontWeight.bold),)),
    );
  }
}
