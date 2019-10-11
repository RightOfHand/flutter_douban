import 'package:dio/dio.dart';


class HeaderInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    // TODO: implement onRequest
    options.connectTimeout=10000;
    options.receiveTimeout=3000;
    options.responseType=ResponseType.json;
    return options;
  }
}