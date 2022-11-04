import 'package:get/get.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class ShelterPageViewController extends GetxService{
  Rx<LatLng> curLocation = LatLng(0, 0).obs;

  void updateLocation(newLocation){
    curLocation(newLocation);
  }

  bool ifLocationNull(){
    return curLocation.value.longitude == 0 && curLocation.value.latitude == 0;
  }
}
