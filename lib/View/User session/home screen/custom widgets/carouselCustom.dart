import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerclub/Model/OfferBanner.dart';
import 'package:readerclub/api/banner.dart';
import 'package:sizer/sizer.dart';

import '../../../../Controller/HomeScreeenController.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
            HomeScreenController controller = Get.put(HomeScreenController());

    return FutureBuilder<OfferBanner>(
        future: controller.offerBannerApi(),
        builder: (context, AsyncSnapshot<OfferBanner> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          OfferBanner offerBanner = snapshot.data!;

          return CarouselSlider(
              items: List.generate(
                offerBanner.dt!.length,
                (index) {
                  String bannerTitle = offerBanner.dt![index].title!;
                  String offer = offerBanner.dt![index].img!;
                  String offerDescription =
                      offerBanner.dt![index].offerDescription!;

                  return CustomOffer(
                      image: offer,
                      offerDescription: offerDescription,
                      bannerTitle: bannerTitle);
                },
              ),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  // viewportFraction: 1,
                  // autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale));
        });
  }
}

class CustomOffer extends StatelessWidget {
  

  const CustomOffer({
    Key? key,
    required this.image,
    required this.offerDescription,
    required this.bannerTitle,
  }) : super(key: key);

  final String image;
  final String offerDescription;
  final String bannerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 15.h,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover),
      ),
      child: OfferTexts(
        offer: offerDescription,
        title: bannerTitle,
      ),
    );
  }
}

class OfferTexts extends StatelessWidget {
  final String title;
  final String offer;

  const OfferTexts({
    required this.offer,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
              color: Color.fromARGB(255, 255, 255, 255),
              shadows: const [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
          Text(
            offer,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: Color.fromARGB(255, 255, 255, 255),
              shadows: const [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
          ElevatedButton(
              child: Text("Check Now",
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.w),
                  ))),
              onPressed: () {})
        ],
      ),
    );
  }
}
