import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> getPermission() async{
  //권한 요청을 위해 요청할 권한 종류를 [디바이스 스토리지,디바이스 위치] 형식으로 담는다.
  Map<Permission,PermissionStatus>statuses=await [Permission.storage,Permission.location].request();
  //권한이 없으면 isGranted는 false
  if(statuses[Permission.storage]!.isGranted){
    return Future.value(true);
  }
  else{
    //Permission은 최초 거부를 누르게되면 Permission 요청을 보내지 않는다.
    //따라서 openAppSettings(); 함수를 이용해 별도 사용자가 직접 권한을 켜줘야 한다.
    return Future.value(false);
  }
}

Future<bool> checkPermission() async {
  //권한 확인(storage 권한 확인)
  bool status= await Permission.storage.isGranted;
  print('check 값:${status}');
  if(status==true){
    return true;
  }else{
    return false;
  }
}

Future<Position> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  print("${position.longitude} ${position.latitude}");
  return position;
}