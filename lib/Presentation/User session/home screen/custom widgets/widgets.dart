import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class BookAndName extends StatelessWidget {
  final String image;
  final String name;
  final String amount;

  const BookAndName({
    Key? key,
    required this.image,
    required this.name,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 40.w,
        height: 30.h,
        child: Column(
          children: [
            Container(
              width: 35.w,
              height: 21.h,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5.w)),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: .5.h,
            ),
            Text(
              amount,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            )
          ],
        ));
  }
}

class CustomButtonHome extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomButtonHome({
    required this.onPressed,
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
        onPressed: onPressed,
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
              onTap: (() {}),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 8.w,
              )),
        ),
      ],
    );
  }
}
