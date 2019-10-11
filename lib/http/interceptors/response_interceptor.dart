import 'package:dio/dio.dart';
import 'package:github_client_app/http/ResultCode.dart';

import '../ResultData.dart';

class ResponseInterceptors extends InterceptorsWrapper {


  @override
  onResponse(Response response) {
    RequestOptions option = response.request;

    print('response interceptor:'+response.data);
    try {
      if (option.contentType != null && option.contentType.primaryType == "json") {

        return new ResultData(response.data, true, ResultCode.SUCCESS);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, ResultCode.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
  }
}