import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/User%20session/Cart/cart.dart';
import 'package:readerclub/Presentation/User%20session/Categories/Categories.dart';

import 'package:sizer/sizer.dart';


class CustomButtonHome extends StatelessWidget {
  const CustomButtonHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33.w,
      height: 5.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 140, 140, 140),
                Color.fromARGB(255, 9, 9, 9)
              ])),
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: Categories(), type: PageTransitionType.rightToLeftWithFade));
        },
        child: Text(
          "View All",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

class Topicons extends StatelessWidget {
  const Topicons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeInRight(
          child: GestureDetector(
              onTap: (() {
                Scaffold.of(context).openDrawer();
              }),
              child: Icon(
                Icons.sort,
                size: 8.w,
              )),
        ),
        FadeInLeft(
          child: GestureDetector(
              onTap: (() {
                Navigator.push(context, PageTransition(child: Cart(), type: PageTransitionType.fade));
              }),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 8.w,
              )),
        ),
      ],
    );
  }
}
