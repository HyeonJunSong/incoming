import 'package:http/http.dart' as http;
import 'package:incoming/constants.dart';
import 'dart:convert';
import 'dart:io';

import 'package:naver_map_plugin/naver_map_plugin.dart';

Future<LatLng> AtoC(String address) async {
  try {
    final response = await http.get(
      Uri.parse('https://${atocBaseUrl}${atocQuery}?query=$address'),
      headers: {
        "X-NCP-APIGW-API-KEY-ID" : atocKeyID,
        "X-NCP-APIGW-API-KEY" : atocKey
      }
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> parsedJson = Map<String, dynamic>.from(List<dynamic>.from(Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["addresses"])[0]);
        return LatLng(double.parse(parsedJson["y"]), double.parse(parsedJson["x"]));
      case 401:
      //
        break;
      default:
      //
        break;
    }
  } on SocketException {
    //
  }

  return LatLng(0, 0);
}

Future<int> CtoA(LatLng coor) async {
  try {
    final response = await http.get(
        Uri.parse('https://${ctoaBaseUrl}${ctoaQuery}?coords=${coor.longitude},${coor.latitude}'),
        headers: {
          "X-NCP-APIGW-API-KEY-ID" : ctoaKeyID,
          "X-NCP-APIGW-API-KEY" : ctoaKey
        }
    );

    print(utf8.decode(response.bodyBytes));

    switch (response.statusCode) {
      case 200:
        // Map<String, dynamic> parsedJson = Map<String, dynamic>.from(List<dynamic>.from(Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["addresses"])[0]);
        // return LatLng(double.parse(parsedJson["y"]), double.parse(parsedJson["x"]));
        Map<String, dynamic> SiDo = Map<String, dynamic>.from(Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["area1"]);
        Map<String, dynamic> SiGoonGoo = Map<String, dynamic>.from(Map<String, dynamic>.from(jsonDecode(utf8.decode(response.bodyBytes)))["area2"]);

      case 401:
      //
        break;
      default:
      //
        break;
    }
  } on SocketException {
    //
  }

  return 0;
}