import 'package:get/get.dart';

class BottomNavigationBarViewController extends GetxService {
  RxInt index = 2.obs;

  void updateIndex(int newIndex){
    index(newIndex);
  }
}