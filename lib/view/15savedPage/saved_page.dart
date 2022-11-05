import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:incoming/constants.dart';
import 'package:incoming/viewModel/shelter_page_view_controller.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 844.h,
      child: Stack(
        children: [
          _background(),
          _appBar(),
        ],
      ),
    );
  }
}

_appBar() => Positioned(
  top: 0,
  child: Container(
    alignment: Alignment.center,
    width: 390.w,
    height: 124.h,
    decoration: BoxDecoration(
      color: ColorAppBar,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.w), bottomRight: Radius.circular(30.w)),
    ),
    padding: EdgeInsets.fromLTRB(0, 44.h, 0, 0),
    child: Text("현재 인터넷이 연결되어있지 않습니다.", style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 22.sp
    ),),
  ),
);

_background() => Positioned(
    width: 390.w,
    height: 844.h,
    child: Container(
      color: ColorBackground,
      child: Obx(() => Column(
        children: [
          SizedBox(height: 180,),
          SingleChildScrollView(
            child: Column(
              children: List<Widget>.from(Get.find<ShelterPageViewController>().shelterList.map((element) => _list(element.name, element.address)))),
          ),
        ],
      ),
    )),
);

_list(String name, String address) => Container(
  width: 408.w,
  height: 89.h,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(name, style: TextStyle(
          color: Colors.black,
        fontSize: 30.sp,
        fontWeight: FontWeight.w400,
      ),),
      Text(address, style: TextStyle(
        color: Colors.black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
      ),
      SizedBox(height: 20,),
    ],
  ),
);