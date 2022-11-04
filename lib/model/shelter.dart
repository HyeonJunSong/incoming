import 'package:http/http.dart' as http;
import 'package:incoming/constants.dart';
import 'package:incoming/model/address_coordinate.dart';
import 'dart:convert';
import 'dart:io';

import 'package:naver_map_plugin/naver_map_plugin.dart';

//shelter
//name : 지명
//address : 주소
//coordinate : 좌표

class Shelter{
  Shelter({
    required this.name,
    required this.address,
    required this.coordinate
  });

  String name = "";
  String address = "";
  LatLng coordinate = LatLng(0.0, 0.0);
}

Future<List<Shelter>> getShelters(int numOfRows, int pageNo, int adm_cd) async {

  try {
    final response = await http.get(
      Uri.parse('http://$shelterBaseUrl$getSheltersQuery?numOfRows=${numOfRows}&pageNo=${pageNo}&adm_cd=${adm_cd}'),
    );
    switch (response.statusCode) {
      case 200:
        List<Shelter> newShelters = [];
        Map<String, List<dynamic>>.from(Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["body"])["items"]?.forEach((element) {
          Map<String, String>? curShelterJson = Map<String, String>.from(Map<String, dynamic>.from(element)["item"]);
          String curAddress = curShelterJson!["sido_nm"]! + curShelterJson!["sgg_nm"]! + curShelterJson!["dong_nm"]! + curShelterJson!["jibun"]!;
          AtoC(curAddress).then((value) => newShelters.add(Shelter(
              name: curShelterJson!["shelter_nm"]!,
              address: curAddress,
              coordinate: value
            ))
          );
        });
        return newShelters;
      case 401:
      //
        break;
      default:
      //
        break;
    }
  } catch (error){
    print(error);
  }
  return [];
}