import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


enum NetworkRequestType {
  POST,
  GET,
  //DELETE,
  //PUT
}

class NetworkHandler {

  final Dio _dio =Get.find<Dio>();

  dynamic request({required NetworkRequestType type,
      required String url,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data}) async {

    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    var queryParameters = <String, dynamic>{};
    var _data = <String, dynamic>{};

    if (type == NetworkRequestType.GET) {
      queryParameters = data??<String, dynamic>{};
    } else if (type == NetworkRequestType.POST) {
      _data = {'data': data};
      _data.removeWhere((k, v) => v == null);
    } else {
    }

    final _result = await _dio.request<Map<String, dynamic>>(
        url,
        queryParameters: queryParameters,
        data: _data);
    return _result.data;
  }

}
