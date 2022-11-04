import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:incoming/constants.dart';
import 'package:incoming/viewModel/bottomNavigationBarViewController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
    width: 390.w,
    height: 124.h,
    decoration: BoxDecoration(
      color: ColorAppBar,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.w), bottomRight: Radius.circular(30.w)),
    ),
    padding: EdgeInsets.fromLTRB(0, 44.h, 0, 0),
    child: Align(
      child: Container(
        width: 329.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.w),
        ),
      ),
    ),
  ),
);

_background() => Positioned(
  width: 390.w,
  height: 844.h,
  child: Container(
    color: ColorBackground,
    child: Column(
      children: [
        SizedBox(height: 138.h,),
        _buttonRow(),
        SizedBox(height: 15.h,),
        _newsCol(),
      ],
    ),
  )
);

_buttonRow() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    _shelterButton(),
    SizedBox(width: 39.w,),
    _howToButton(),
  ],
);

_shelterButton() => ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: ColorWhite,
    fixedSize: Size(145.w, 150.h),
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.w)
    ),
    
  ),
  onPressed: (){
    Get.find<BottomNavigationBarViewController>().updateIndex(3);
  },
  child: Container(
    padding: EdgeInsets.all(12.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/img/Placeholder.png", width: 36.w, height: 36.h,),
        Text("대피소", style: TextStyle(
          color: ColorBlack,
          fontSize: 20.sp,
        ),),
        Text("위치보기", style: TextStyle(
          color: ColorBlack,
          fontSize: 20.sp,
        ),),
      ],
    ),
  ),
);

_howToButton() => ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: ColorWhite,
    fixedSize: Size(145.w, 150.h),
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.w)
    ),

  ),
  onPressed: (){
    Get.find<BottomNavigationBarViewController>().updateIndex(1);
  },
  child: Container(
    padding: EdgeInsets.all(12.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/img/megaphone-1.png", width: 36.w, height: 36.h,),
        Text("행동 요령", style: TextStyle(
          color: ColorBlack,
          fontSize: 20.sp,
        ),),
        Text("확인하기", style: TextStyle(
          color: ColorBlack,
          fontSize: 20.sp,
        ),),
      ],
    ),
  ),
);

_newsCol() => Container(
  width: 329.w,
  height: 414.h,
  child: Column(
    children: [
      _textRow(),
//      SizedBox(height: 9.h,),
      _newsBox(),
    ],
  ),
);

_textRow() => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text("News", style: TextStyle(
      fontSize: 32.sp,

    ),),
    Text("더보기 >", style: TextStyle(
      fontSize: 20.sp,
      color: ColorSubText,
    ),),
  ],
);

_newsBox() => Container(
  width: 329.w,
  height: 360.h,
  decoration: BoxDecoration(
    color: ColorWhite,
    borderRadius: BorderRadius.circular(30.w),
  ),
);