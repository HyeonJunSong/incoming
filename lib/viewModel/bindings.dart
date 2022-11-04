import 'package:get/get.dart';
import 'package:incoming/viewModel/shelter_page_view_controller.dart';

class InitBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ShelterPageViewController());
  }
}