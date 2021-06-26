

import 'package:get/get.dart';
import 'package:money_manga/core/enums/status.dart';
import 'package:money_manga/core/network/response/api_responce.dart';

import '../../../locator.dart';
import '../NetworkHandler.dart';
import '../_result.dart';
import '../retrofit_client.dart';

class BaseDataSource extends NetworkHandler {

  var retroClient = Get.find<RestClient>();
  var service = Get.find<RestClient>();

  /*Future<Result<T>> request<T>({@required NetworkRequestType type,
    @required String url,
    Map<String, dynamic> headers,
    Map<String, dynamic> data}) async {
    var resp = NetworkHandler().request(type: type,
        url: url,
        headers: headers,
        data: data
    );

    return handleResponse<T>(url,resp);

  }*/

  /*Future<Result> handleResponse<T>(String type, dynamic resp) {
    var res;
    switch(type){
      case Api.gitSearch: res = GitSearchResponse.fromJson(resp);
    }
    return Result(Status.SUCCESS, res, "");
  }*/

  Future<Result<T?>> getResult<T>(Future<T> apiCall) async {
    try {
      print('===>Api ');
      var resp = await apiCall;
      //print("===>Api base ds ");
      //print(resp);
      print('===>Api end ');

      if (resp != null) {
        if( resp is ApiResponse) {
          if (resp.isOK()) {
            return Result(Status.SUCCESS, resp, 'success');
          } else {
            return Result.error(resp.message!);
          }
        }else{
          return Result(Status.SUCCESS, resp, 'success');
        }
      } else {
        return Result.error('failed');
      }
    } catch (e) {
      print(e);
    }
    print('===>Api end ');
    return Result(Status.ERROR, null, 'failed');
  }

}
