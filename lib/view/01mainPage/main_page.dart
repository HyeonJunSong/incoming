import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:incoming/model/address_coordinate.dart';
import 'package:incoming/model/curLocation.dart';
import 'package:incoming/view/11newsPage/news_page.dart';
import 'package:incoming/view/12howToPage/how_to_page.dart';
import 'package:incoming/view/13homePage/homePage.dart';
import 'package:incoming/view/14shelterPage/shelter_page.dart';
import 'package:incoming/view/15savedPage/saved_page.dart';
import 'package:incoming/viewModel/bottomNavigationBarViewController.dart';
import 'package:incoming/viewModel/shelter_page_view_controller.dart';
import 'package:incoming/widgets/bottomNavigationBar.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      getPermission();
      getCurrentLocation().then((value) {
        Get.find<ShelterPageViewController>().updateLocation(LatLng(value.latitude, value.longitude));
        CtoA(LatLng(value.latitude, value.longitude)).then((coor) =>
            Get.find<ShelterPageViewController>().getShelterList(coor));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() =>
            AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeIn,
              left: Get.find<BottomNavigationBarViewController>().index.value * -390.w,
              child: _pages(),
            ),
          ),
          Positioned(
            top: 753.h,
            child: bottomNavigationBar()
          ),
        ],
      ),
    );
  }
}

_pages() => Container(
  width: 390.w * 5,
  height: 844.h,
  child:   Stack(
    children: [
      // Positioned(
      //   left: 390.w * 0,
      //   child: NewsPage()
      // ),
      Positioned(
        left: 390.w * 1,
        child: HowToPage()
      ),
      Positioned(
        left: 390.w * 2,
        child: HomePage()
      ),
      Positioned(
        left: 390.w * 3,
        child: ShelterPage()
      ),
      Positioned(
        left: 390.w * 4,
        child: SavedPage()
      ),
    ],
  ),
);