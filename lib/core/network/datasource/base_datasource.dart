

import 'package:get/get.dart';
import 'package:money_manga/core/enums/status.dart';
import 'package:money_manga/core/network/response/api_responce.dart';

import '../NetworkHandler.dart';
import '../_result.dart';
import '../retrofit_client.dart';

class BaseDataSource extends NetworkHandler {

  var retroClient = Get.find<RestClient>();
  Future<Result<T>> getResult<T>(Future<T> apiCall) async {
    try {
      print('===>Api ');
      var resp = await apiCall;
      print('===>Api end ');

      if (resp != null) {
        if (resp is ApiResponse) {
          if (resp.isOK()) {
            return Result(Status.SUCCESS, resp, 'success');
          } else {
            return Result(Status.ERROR, null, "failed");
          }
        } else {
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
