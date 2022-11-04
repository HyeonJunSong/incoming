import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:incoming/model/curLocation.dart';
import 'package:incoming/view/11shelterPage/shelter_page.dart';
import 'package:incoming/viewModel/shelter_page_view_controller.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      getPermission();
      getCurrentLocation().then((value) => Get.find<ShelterPageViewController>().updateLocation(LatLng(value.latitude, value.longitude)));
      Get.find<ShelterPageViewController>().getShelterList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShelterPage(),
    );
  }
}
