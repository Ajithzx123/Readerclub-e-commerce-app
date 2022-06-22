import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


import 'package:sizer/sizer.dart';

import '../../Cart/cart.dart';
import '../../Categories/Categories.dart';




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
