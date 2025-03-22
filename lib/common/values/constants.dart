import 'package:dio/dio.dart';

/// 常量
class Constants {
  // 服务 api
  // static const baseUrl = 'http://localhost:8000';
  static const baseUrl = 'https://fish-server-web-hmq6.shuttle.app';

  // 骨架屏默认图片
  static const skeletonImg = "https://cdn.pixabay.com/photo/2025/03/06/08/25/blueberries-9450130_960_720.jpg";

  // 服务端返回状态码(成功)
  static const successCode = 200;

  // 请求头
  static const headers = {"version": "1.0.0", "flutter": "3.10.0"};

  //发送超时时间
  static const sendTimeout = Duration(seconds: 5);

  //连接超时时间
  static const connectTimeout = Duration(seconds: 5);

  //接收超时时间
  static const receiveTimeout = Duration(seconds: 5);

  //content-type
  static const contentType = Headers.formUrlEncodedContentType;

  //response-type
  static const responseType = ResponseType.json;

  //最小请求耗时
  static const minWaitingTime = 1000;
}
