import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readerclub/Controller/UserDetails.dart';
import 'package:readerclub/Controller/address_controller.dart';
import 'package:readerclub/Controller/controller_object.dart';
import 'package:readerclub/Model/shared_prefrences.dart';
import 'package:readerclub/View/widgets/BlueButton.dart';
import 'package:sizer/sizer.dart';
import 'address edit.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var details = SharedPrefrenceModel.getString('details');

  var userdetails = SharedPrefrenceModel.getString('userDetails');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addresscontroller.getPodDetails();
  }

  @override
  Widget build(BuildContext context) {
    print(userdetails);
    UserController controller = Get.put(UserController());
    // HomeController addressController = Get.put(HomeController());

   // String date =DateFormat('yyyy/MM/dd').format(details["dt"][0]["dob"]);
//print(date);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(details["dt"][0]["image"]),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
          top: 35.h,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.w),
                    topRight: Radius.circular(10.w))),
            // height: 100.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(userdetails["user"]["name"],
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.bold)),
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
                            details["dt"][0]["gender"],
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),

                        //   Text(
                            
                        // ,
                        //     style: TextStyle(
                        //         fontSize: 15.sp, fontWeight: FontWeight.w600),
                        //   ),
                          // SizedBox(
                          //   height: 1.h,
                          // ),
                          Text(
                            userdetails["user"]["email"],
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            userdetails["user"]["mobile"].toString(),
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
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
                                fontSize: 25.sp, fontWeight: FontWeight.bold)),
                        GestureDetector(
                            onTap: () {
                              print("sffdfdfdfdsfdfdf");
                              Get.to(() => AddressEdit());
                            },
                            child: const Icon(Icons.add_outlined))
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(() => addresscontroller.podDetails.isNotEmpty
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: addresscontroller.podDetails.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(2.w),
                                child: Center(
                                  child: Slidable(
                                    enabled: true,
                                    direction: Axis.horizontal,
                                    key: const ValueKey(1),
                                    endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        dismissible:
                                            DismissiblePane(onDismissed: () {}),
                                        children: [
                                          SlidableAction(
                                            onPressed: ((context) {

                                            }),
                                            backgroundColor: Colors.red,
                                            foregroundColor: Colors.white,
                                            icon: Icons.archive,
                                            label: "delete",
                                          ),
                                          SlidableAction(
                                            onPressed: ((context) {}),
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.white,
                                            icon: Icons.save,
                                            label: "save",
                                          )
                                        ]),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 222, 222, 222),
                                          borderRadius:
                                              BorderRadius.circular(7.w)),
                                      width: 80.w,
                                      height: 15.h,
                                      child: Padding(
                                        padding: EdgeInsets.all(5.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              addresscontroller
                                                  .podDetails[index]
                                                  .fullAddress!,
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              addresscontroller
                                                  .podDetails[index].pincode
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              addresscontroller
                                                  .podDetails[index].landmark!,
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Text("Add address")),
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

// class Addresscutom extends StatelessWidget {
//   const Addresscutom({
//     required value,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(2.w),
//       child: Center(
//         child: Slidable(
//           enabled: true,
//           direction: Axis.horizontal,
//           key: const ValueKey(1),
//           endActionPane: ActionPane(
//               motion: const ScrollMotion(),
//               dismissible: DismissiblePane(onDismissed: () {}),
//               children: [
//                 SlidableAction(
//                   onPressed: ((context) {}),
//                   backgroundColor: Colors.red,
//                   foregroundColor: Colors.white,
//                   icon: Icons.archive,
//                   label: "delete",
//                 ),
//                 SlidableAction(
//                   onPressed: ((context) {}),
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   icon: Icons.save,
//                   label: "save",
//                 )
//               ]),
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 222, 222, 222),
//                 borderRadius: BorderRadius.circular(7.w)),
//             width: 80.w,
//             height: 15.h,
//             child: Padding(
//               padding: EdgeInsets.all(5.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     addresscontroller.podDetails[value].fullAddress!,
//                     style:
//                         TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
//                   ),
//                   SizedBox(
//                     height: 1.h,
//                   ),
//                   Text(
//                     addresscontroller.podDetails[Value].pincode.toString(),
//                     style:
//                         TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
//                   ),
//                   SizedBox(
//                     height: 1.h,
//                   ),
//                   Text(
//                     addresscontroller.podDetails[0].landmark!,
//                     style:
//                         TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
