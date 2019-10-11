import 'package:dio/dio.dart';

import '../../config/Config.dart';

class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    if (Config.DEBUG) {
      print("请求url：${options.path}");
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    return options;
  }

  @override
  onResponse(Response response) {
    if (Config.DEBUG) {
      if (response != null) {
        print('返回数据: ' + response.toString());
      }
    }
    return response.toString(); // continue
  }

  @override
  onError(DioError err) {
    if (Config.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? "");
    }
    return err;
  }


}
