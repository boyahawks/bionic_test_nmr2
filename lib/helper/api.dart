import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Api {
  static var basicAuth = 'Basic ' +
      base64Encode(utf8.encode("wrapidapplication:@angkatangontortahun2016@"));

  // static var mainUrl = "https://apiwrapid.aksaramerakinusantara.com/";
  static var mainUrl = "http://192.168.43.160:3600/";
  static var basicUrl = mainUrl + "api/";
  static var fotoProfile = mainUrl + "profile/";
  static var pengajuanTopUpAsset = mainUrl + "pengajuan/topup/";

  static Future connectionApi(
      String typeConnect, valFormData, String url, String token) async {
    var getUrl = basicUrl + url;
    Map<String, String> headers = {
      'Authorization': basicAuth,
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'token': token,
    };
    if (typeConnect == "post" || typeConnect == "patch") {
      try {
        var url = Uri.parse(getUrl);
        if (typeConnect == "post") {
          var response =
              await post(url, body: jsonEncode(valFormData), headers: headers);
          return response;
        } else if (typeConnect == "patch") {
          var response =
              await patch(url, body: jsonEncode(valFormData), headers: headers);
          return response;
        }
      } on SocketException catch (e) {
        print(e);
        return false;
      }
    } else {
      try {
        var url = Uri.parse(getUrl);
        var response = await get(url, headers: headers);
        return response;
      } on SocketException {
        return false;
      }
    }
  }

  static Future connectionApiUploadFile(String url, File newFile) async {
    var getUrl = basicUrl + url;
    Map<String, String> headers = {
      'Authorization': basicAuth,
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final url = Uri.parse(getUrl);
      var request = http.MultipartRequest('POST', url);
      request.files.add(
        await http.MultipartFile.fromPath('sampleFile', newFile.path),
      );
      request.headers.addAll(headers);
      var response = await request.send();
      var respStr = await response.stream.bytesToString();
      return respStr;
    } on SocketException {
      return false;
    }
  }
}
