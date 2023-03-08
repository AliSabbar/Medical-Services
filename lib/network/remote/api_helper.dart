import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../components/constant.dart';
import '../end_points.dart';

class ApiHelper {
// GET DATA

  static Future getData({required String url}) async {
    try {
      http.Response response = await http
          .get(Uri.parse(EndPoints.baseUrl + url), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 20),
              onTimeout: () => throw 'Check Your Internet connection');

      return jsonResponse(response);
    } on SocketException {
      throw 'check your internet in your device';
    } catch (e) {
      print(e.toString());
    }
  }

// POST DATA

  static Future postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse(EndPoints.baseUrl + url),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
          });
      // .timeout(const Duration(seconds: 10),
      //         onTimeout: () => throw 'Check Your Internet connection');

      return jsonResponse(response);
    } on SocketException {
      throw 'check your internet in your device';
    } catch (e) {
      print(e.toString());
    }
  }

  static jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 404:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
    }
  }
}
