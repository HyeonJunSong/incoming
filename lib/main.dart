import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:incoming/viewModel/bindings.dart';
import 'view/01mainPage/main_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'incoming',
            initialRoute: "/Home",
            getPages: [
              GetPage(name: '/Home', page: () => const MainPage(), binding: InitBinding()),
            ],
//            initialBinding: InitBinding(),
          );
        });
  }
}