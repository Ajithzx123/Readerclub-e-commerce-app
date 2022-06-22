import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:readerclub/Model/productModel.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/BlueButton.dart';

class InsideBook extends StatelessWidget {
  final Details item;
   const InsideBook({required this.item, Key? key}) : super(key: key);

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: FadeInDown(
                      child: Container(
                        height: 60.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  item.img!,
                                ),
                                fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.w)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             item.title!,
                              style: TextStyle(
                                  fontSize: 30.sp, fontWeight: FontWeight.w900),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Color.fromARGB(255, 82, 82, 82),
                              size: 28.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          item.author!,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 82, 82, 82)),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "₹${item.price}",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 82, 82, 82)),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          item.description!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(7.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FadeInLeft(child: ButtonBlue(ontap: (){},title: "Buy Now",)),
                              FadeInRight(child: ButtonBlue(ontap: (){},title: "Add to Cart",)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

