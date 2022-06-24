import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:readerclub/View/widgets/BlueButton.dart';
import 'package:sizer/sizer.dart';

import 'address edit.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(clipBehavior: Clip.none,
          // fit: StackFit.expand,
          children: [
            Container(
              height: 37.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/236x/8e/cb/d8/8ecbd8e82dd67d64460d56d30535f4b5.jpg"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              top: 32.h,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.w),
                        topRight: Radius.circular(10.w))),
                height: 100.h,
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.all(9.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ajith kumar",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold)),
                            GestureDetector(child: const Icon(Icons.edit))
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "17-02-2000",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Kumarajith577@gmail.com",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "9747767979",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Address",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold)),
                            GestureDetector(
                                onTap: () {
                                  print("sffdfdfdfdsfdfdf");
                                  Get.to(() => AddressEdit());
                                },
                                child: const Icon(Icons.edit))
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        const Addresscutom(),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Addresscutom(),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Addresscutom(),
                        SizedBox(
                          height: 3.h,
                        ),
                        Center(child: ButtonBlue(ontap: () {}, title: "Logout"))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}

class Addresscutom extends StatelessWidget {
  const Addresscutom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Slidable(
        key: const ValueKey(1),
        endActionPane: ActionPane(
            motion: ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: (){}),
            children: [SlidableAction(onPressed: ((context) {}
            
            ),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.archive,

            ),
            SlidableAction(onPressed: ((context) {
              
            }),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: "save",
            
            
            )]),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 222, 222, 222),
              borderRadius: BorderRadius.circular(7.w)),
          width: 80.w,
          height: 15.h,
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "kakkand, kochi, kerala",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "678688",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Carnival infopark",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
