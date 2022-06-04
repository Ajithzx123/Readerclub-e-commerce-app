import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:readerclub/Presentation/widgets/BookCustom.dart';
import 'package:sizer/sizer.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

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
                "Romance",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),
              )),
              SizedBox(height: 2.h,),
              Container(
                height: 5.5.h,
                width: 85.w,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 195, 195, 195),
                  borderRadius:  BorderRadius.circular(10.w),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(2.0.w),
                  child: TextFormField(

                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search here',
                      
                    ),
                  ),
                ),
              ),
            ]
          ),
              SizedBox(height: 3.h,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInLeft(
                        child: const BookAndName(
                            image:
                                "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                            name: "Romeo & Juliet",
                            amount: "₹549.00"),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      FadeInRight(
                        child: const BookAndName(
                            image:
                                "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781476792491/after-we-collided-9781476792491_hr.jpg",
                            name: "After",
                            amount: "₹999.00"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInLeft(
                        child: const BookAndName(
                            image:
                                "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                            name: "Romeo & Juliet",
                            amount: "₹549.00"),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      FadeInRight(
                        child: const BookAndName(
                            image:
                                "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781476792491/after-we-collided-9781476792491_hr.jpg",
                            name: "After",
                            amount: "₹999.00"),
                      ),
                    ],
                  ),
                          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInLeft(
                        child: const BookAndName(
                            image:
                                "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                            name: "Romeo & Juliet",
                            amount: "₹549.00"),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      FadeInRight(
                        child: const BookAndName(
                            image:
                                "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781476792491/after-we-collided-9781476792491_hr.jpg",
                            name: "After",
                            amount: "₹999.00"),
                      ),
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
