import 'package:get/get.dart';
import 'package:incoming/model/shelter.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class ShelterPageViewController extends GetxService{
  Rx<LatLng> curLocation = LatLng(0, 0).obs;
  RxList<Shelter> shelterList = <Shelter>[].obs;

  void updateLocation(newLocation){
    curLocation(newLocation);
  }

  bool ifLocationNull(){
    return curLocation.value.longitude == 0 && curLocation.value.latitude == 0;
  }

  void getShelterList() async {
    shelterList(await getShelters(10, 1, 2714010100));
  }

  List<Marker> shelterListToMarkers(){
    List<Marker> markers = [];
    shelterList.forEach((element) {
      markers.add(Marker(
        markerId: element.hashCode.toString(),
        position: LatLng(element.coordinate.latitude, element.coordinate.longitude)
      ));
//      print(shelterList[element.hashCode]);
    });
    return markers;
  }
}
