import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sheen_ai_application/utils/env.dart';

class Fetch {
 // final String _apiHost = Env.getString('API_HOST');
 // final int _apiPort = Env.getInt('API_PORT');
 // final String _apiScheme = Env.getString('API_SCHEME');

  final _dio = Dio();
  var _uri;
  //final _uri = '$_apiScheme://$_apiHost';
  // Fetch() {
  //   _uri = '$_apiScheme://$_apiHost';
  // }
  // _url(
  //     {required String path,
  //     Map<String, String>? queryParamters,
  //     Object? data}) {
  //   return Uri(
  //           host: 'e-creatives-dev.de.r.appspot.com/api/',
  //           // port: _apiPort,
  //           scheme: 'https',
  //           path: path,
  //           queryParameters: queryParamters)
  //       .toString();
  //}

  _headers(token) {
    // print(token);
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'content-language': 'en-US',
      'Authorization': '$token',
    };
  }

  Future<String?> get(
      {required String path,
      String? token,
      Map<String, String>? queryParameters}) async {
    try {
      print('http response in get method');
      Response httpResponse = await _dio.get('$_uri$path?$queryParameters',
          options: Options(
              headers: _headers(token),
              validateStatus: ((status) => status! < 500)));
      return responseHandler(httpResponse);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Network error: $e');
    }
  }

  Future<String?> post(
      {required String path,
      required Map<String, String> queryParameters,
      required Map<String, dynamic>? data,
      required String? token}) async {
    try {
      print('i Am in response$queryParameters');
      Response httpResponse = await _dio.post(
          'https://e-creatives-dev.de.r.appspot.com/api/$path',
          queryParameters: queryParameters,
          data: data,
          options: Options(
              headers: _headers(token),
              validateStatus: ((status) => status! < 500)));
      print('Http response $httpResponse');
      return responseHandler(httpResponse);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Network error: $e');
    }
  }

  Future<String?> destroy(
      {required String path,
      required String token,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      print('i am in a response');
      Response httpResponse = await _dio.delete('$_uri$path?$queryParameters',
          options: Options(
              headers: _headers(token),
              validateStatus: ((status) => status! < 500)));
      print('Http response $httpResponse');
      return responseHandler(httpResponse);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Network error $e');
    }
  }

  static dynamic responseHandler(Response response) {
    String? res;
    print('in response handler');
    switch (response.statusCode) {
      case 200:
      case 201:
      case 'Ok':
        res = jsonEncode(response.data);
        print(res);
        return res;
      case 400:
      case 401:
      case 403:
        res = jsonEncode(response.data);
        print('null');
        Fluttertoast.showToast(msg: jsonDecode(res)['message']);
      case 500:
      default:
        return Fluttertoast.showToast(
            msg:
                'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      // 'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
