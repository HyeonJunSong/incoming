import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:incoming/model/curLocation.dart';
import 'package:incoming/viewModel/shelter_page_view_controller.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class ShelterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 390.w,
      // height: 844.h,
      // child : Obx(() => Get.find<ShelterPageViewController>().ifLocationNull() ?
      //   CircularProgressIndicator()
      //   : NaverMap(
      //     initialCameraPosition: CameraPosition(
      //       target: Get.find<ShelterPageViewController>().curLocation.value,
      //     ),
      //     markers: Get.find<ShelterPageViewController>().shelterListToMarkers(),
      //   )
      // )
    );
  }
}