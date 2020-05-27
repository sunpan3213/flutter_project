import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wanandroid/generated/json/base/json_convert_content.dart';
import 'package:wanandroid/model/registe_entity.dart';

class NetUtils {
  NetUtils._internal() {
    _dio = Dio();
    _setDioOptions();
  } //私有构造函数
  static NetUtils _instance = NetUtils._internal(); //保存单例
  static NetUtils _getInstance() {
    if (_instance == null) {
      _instance = NetUtils._internal();
    }
    return _instance;
  }

  static NetUtils get instance => _getInstance();

  Dio _dio;

  void _setDioOptions() {
    _dio.options.baseUrl = 'https://www.wanandroid.com';
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  void _post<T>(String url, Map<String, dynamic> params, Function(T) success, Function error) async {
    try {
      var response = await _dio.post(url, queryParameters: params);
      if (response.statusCode == HttpStatus.ok) {
        var code = response.data['errorCode'];
        var rsp = response.data['data'];
        var msg = response.data['errorMsg'];
        if (code == 0) {
          var t = JsonConvert.fromJsonAsT<T>(rsp);
          success(t);
        } else {
          error(msg);
        }
      } else {
        error(response.statusMessage);
      }
    } catch (e) {
      error(e.toString());
    }
  }

  void registe(String account, String pwd, Function(RegisteData) success, Function error) {
    Map<String, dynamic> params = {"username": account, "password": pwd, "repassword": pwd};
    _post("/user/register", params, success, error);
  }
}
