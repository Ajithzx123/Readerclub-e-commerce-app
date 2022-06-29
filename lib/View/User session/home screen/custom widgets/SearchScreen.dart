import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerclub/Model/productModel.dart';
import 'package:sizer/sizer.dart';

import '../../../../Controller/HomeScreeenController.dart';
import '../../../widgets/BookCustom.dart';
import '../../Book inside/insideBook.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchInput = '';

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(5.0.w),
        child: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 204, 204, 204),
                  borderRadius: BorderRadius.circular(10.w)),
              child: Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: TextFormField(
                  onChanged: (value) {
                  setState(() {
                    searchInput = value;
                  });
                    
                  },
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Book",
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SingleChildScrollView(
              child: FutureBuilder<ProductsModel>(
                  future: controller.searchApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const Text("No books found");
                    }
                    ProductsModel search = snapshot.data!;
                    final booksList = search.dt;
                    List<Details> searchResultList = booksList!
                        .where((element) => element.title!
                            .toLowerCase()
                            .contains(searchInput.toLowerCase()))
                        .toList();
                    return 
                    searchResultList.isNotEmpty ?

                     GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: searchResultList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.h,
                        crossAxisSpacing: 5.w,
                        childAspectRatio: 150 / 250,
                      ),
                      itemBuilder: (context, index) {
                        return BookAndName(
                          tap: () {
                            Get.to(() => InsideBook(item: searchResultList[index]));
                          },
                          image: searchResultList[index].img!,
                          name: searchResultList[index].title!,
                          amount: "₹${searchResultList[index].price!.toString()}",
                        );
                      },
                    ) : CircularProgressIndicator();
                  }),
            )
          ],
        ),
      )),
    );
  }
}
