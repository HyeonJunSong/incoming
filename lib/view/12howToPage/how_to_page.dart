import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowToPage extends StatelessWidget {
  const HowToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 844.h,
      color: Color(0xffE9ECE8),
      child : Center(
        child : Column(
          children: <Widget>[
            Container(
              width: 390.w,
              height: 172.h,
              child: Text("행동 요령", style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w800), textAlign: TextAlign.center),
              padding: EdgeInsets.fromLTRB(0, 44.h, 0, 0),
              decoration: BoxDecoration(
                color: Color(0xffA2B29F),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
            Container(
              child : Row(
                children: <Widget>[
                  Image.asset('assets/img/mask.png', height: 50.h, width: 50.w, ),
                  SizedBox(
                    width : 10.w,
                    height: 5.h,
                  ),
                  Text("화생방 상황 발생 시", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.black), textAlign: TextAlign.center),
                ],
              ),
              width: 360.w,
              height: 69.h,
              margin: EdgeInsets.fromLTRB(15.w, 14.h, 15.w, 7.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),

            Container(
              child : Row(
                children: <Widget>[
                  Image.asset('assets/img/rocket.png', height: 50.h, width: 50.w, ),
                  SizedBox(
                    width : 10.w,
                    height: 5.h,
                  ),
                  Text("포격 및 폭격 발생 시", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.black), textAlign: TextAlign.center),
                ],
              ),
              width: 360.w,
              height: 69.h,
              margin: EdgeInsets.fromLTRB(15.w, 14.h, 15.w, 7.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}