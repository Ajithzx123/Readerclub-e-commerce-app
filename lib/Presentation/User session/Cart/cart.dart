import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

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
          Column(
            children: [
              Center(
                child: Text(
                  "My Cart",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 20.h,
                width: 80.w,
                // color: Colors.grey,
                child: Row(
                  children: [
                  Container(
                    height: 18.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("Assets/Book image/After.webp"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5.w)),
                  ),

                  Column(
                    children: [
                      Text("After"),
                      Text("₹700.00")
                    ],
                  )
                ]),
              )
            ],
          )
        ],
      )),
    );
  }
}
