import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerclub/View/User%20session/Book%20inside/insideBook.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/BookCustom.dart';

class WishLists extends StatelessWidget {
  const WishLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5.w),
            child: GestureDetector(
              child: const Icon(Icons.arrow_back),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Column(children: [
            Center(
                child: Text(
              "Wishlist",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),
            )),
            SizedBox(
              height: 2.h,
            ),
          ]),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInLeft(
                        child: BookAndName(
                          tap: () {
                            // Get.to(() => InsideBook());
                          },
                            image:
                                "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                            name: "Romeo & Juliet",
                            amount: "₹549.00"),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      // FadeInRight(
                      //   child: BookAndName(

                      //       image:
                      //           "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781476792491/after-we-collided-9781476792491_hr.jpg",
                      //       name: "After",
                      //       amount: "₹999.00"),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
