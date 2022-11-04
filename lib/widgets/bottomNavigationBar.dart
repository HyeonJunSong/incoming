import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incoming/constants.dart';
import 'package:get/get.dart';
import 'package:incoming/viewModel/bottomNavigationBarViewController.dart';
import 'package:incoming/viewModel/shelter_page_view_controller.dart';

bottomNavigationBar() => Container(
  width: 390.w,
  height: 91.h,
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
  child: Stack(
    children: [
      _indicator(),
      _navBars(),
    ],
  )
);

_navBars() => Positioned(
  child: Container(
    width: 390.w,
    height: 91.h,
    padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _news(),
        _action(),
        _main(),
        _shelters(),
        _savedShelters()
      ],
    ),
  ),
);

_news() => GestureDetector(
  child: Image.asset("assets/img/NevNews.png", width: 50.w, height: 65.h,),
  onTap: (){
    Get.find<BottomNavigationBarViewController>().updateIndex(0);
  },
);

_action() => GestureDetector(
  child: Image.asset("assets/img/NevInst.png", width: 50.w, height: 65.h,),
  onTap: (){
    Get.find<BottomNavigationBarViewController>().updateIndex(1);
  },
);

_main() => GestureDetector(
  child: Image.asset("assets/img/NevHome.png", width: 50.w, height: 65.h,),
  onTap: (){
    Get.find<BottomNavigationBarViewController>().updateIndex(2);
  },
);

_shelters() => GestureDetector(
  child: Image.asset("assets/img/NevMap.png", width: 50.w, height: 65.h,),
  onTap: (){
    Get.find<BottomNavigationBarViewController>().updateIndex(3);
  },
);

_savedShelters() => GestureDetector(
  child: Image.asset("assets/img/NevSaved.png", width: 50.w, height: 65.h,),
  onTap: (){
    Get.find<BottomNavigationBarViewController>().updateIndex(4);
  },
);

_indicator() => Obx( () =>
  AnimatedPositioned(
    duration: Duration(milliseconds: 100),
    curve: Curves.ease,
    top: 9.h,
    left: -5.w + (Get.find<BottomNavigationBarViewController>().index.value) * 78.w,
    child: Container(
      margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
      child: Image.asset("assets/img/NavOn.png", width: 60.w, height: 82.h,)
    )
  ),
);