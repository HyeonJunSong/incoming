import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowToPage extends StatelessWidget {
  const HowToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: Color(0xffE9ECE8),
        child : Center(
          child : Column(
            children: <Widget>[
              Container(
                  child : Text("행동 요령", style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w800), textAlign: TextAlign.center),
                  width: 390.w,
                  height: 172.h,
                  padding: EdgeInsets.only(left: 0, top: 52),
                  decoration: BoxDecoration(
                    color: Color(0xffA2B29F),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
              ),

              SizedBox(
                width: 100.w,
                height: 14.h
              ),
              Container(
                child : Text("화생방 상황 발생 시", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.black), textAlign: TextAlign.center),
                width: 360.w,
                height: 69.h,
                padding: EdgeInsets.only(left: 60, top: 19),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),

              SizedBox(
                  width: 100.w,
                  height: 14.h
              ),

              Container(
                child : Text("포격 및 폭격 발생 시", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.black), textAlign: TextAlign.center),
                width: 360.w,
                height: 69.h,
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
          ),
    );
  }
}
