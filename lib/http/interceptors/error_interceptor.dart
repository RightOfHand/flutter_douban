import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:github_client_app/http/ResultCode.dart';

import '../ResultData.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";


class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData(ResultCode.errorHandleFunction(ResultCode.NETWORK_ERROR, "打开网路设置", false), false, ResultCode.NETWORK_ERROR));
    }
    return options;
  }
}
