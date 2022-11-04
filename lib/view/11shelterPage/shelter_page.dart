import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:incoming/model/curLocation.dart';
import 'package:incoming/viewModel/shelter_page_view_controller.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class ShelterPage extends StatelessWidget {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   WidgetsBinding.instance.addPostFrameCallback((_){
  //      getCurrentLocation().then((value) {
  //        position = LatLng(value.latitude, value.longitude);
  //        print(position);
  //      });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Obx(() => Get.find<ShelterPageViewController>().ifLocationNull() ?
        CircularProgressIndicator()
        : NaverMap(
          initialCameraPosition: CameraPosition(
            target: Get.find<ShelterPageViewController>().curLocation.value,
          ),
        )
      )
    );
  }
}