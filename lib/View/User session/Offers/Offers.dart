import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerclub/Model/OfferBanner.dart';
import 'package:readerclub/View/User%20session/home%20screen/custom%20widgets/carouselCustom.dart';
import 'package:sizer/sizer.dart';

import '../../../Controller/HomeScreeenController.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        HomeScreenController controller = Get.put(HomeScreenController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text("Offers",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
      ),
      body: FutureBuilder<OfferBanner>(
        future: controller.offerBannerApi(),
        builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          OfferBanner data = snapshot.data!;

          return ListView.separated(
            padding: EdgeInsets.only(top: 2.h,left: 10.w,right: 10.w),
              itemCount: data.dt!.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 3.h,
                );
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 25.h,
                  child: CustomOffer(
                      image: data.dt![index].img!,
                      offerDescription: data.dt![index].offerDescription!,
                      bannerTitle: data.dt![index].title!),
                );
              });
        },
      ),
    );
  }
}
