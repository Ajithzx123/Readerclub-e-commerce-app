import 'package:flutter/material.dart';
import 'package:readerclub/View/User%20session/RegisterScreen/widget/widgets.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "My Cart",
          style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w900,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.only(bottom: 6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 55.h,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  itemCount: 2,
                  itemBuilder: ((context, index) {
                    return const CartItems(
                        title: "After",
                        price: "₹500",
                        img: "Assets/Book image/After.webp",
                        count: "1");
                  })),
            ),
            Container(
              height: 20.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 223, 223, 223),
                  borderRadius: BorderRadius.circular(7.w)),
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order Summary",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold)),
                        Text("Sub Total: ₹500.00",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600)),
                        Text("Shipping : ₹40.00",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600)),
                        Text("Total : ₹540.00",
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    PageViewNextButton(icon: Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  final String title;
  final String price;
  final String img;
  final String count;
  const CartItems({
    Key? key,
    required this.title,
    required this.price,
    required this.img,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 80.w,
      child: Row(children: [
        Container(
          height: 15.h,
          width: 22.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.w)),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 5.w, right: 15.w, top: 5.h, bottom: 5.h),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.h),
              Text(price,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.remove_circle),
                  SizedBox(width: 1.w),
                  Text(
                    count,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 1.w),
                  const Icon(Icons.add_circle)
                ],
              )
            ],
          ),
        ),
        const Spacer(),
        Icon(
          Icons.delete_outline_rounded,
          size: 8.w,
        )
      ]),
    );
  }
}
