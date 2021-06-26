import 'package:get/get.dart';
import 'package:money_manga/core/database/table/_repository.dart';
import 'package:money_manga/core/enums/status.dart';
import 'package:money_manga/core/network/_result.dart';
import 'package:money_manga/core/network/datasource/git_datasource.dart';


class GitRepository {
  final GitDataSource _gitDataSource = Get.find<GitDataSource>();
  //final GitDao _gitDao =  Get.find<GitDao>();

  Future<Result<List<Repository>>> getSearch(String data) async {
    var resp = await _gitDataSource.search(data);
    if (resp.status == Status.SUCCESS) {
      //_productDao.insertProducts( resp.data.data);
    }
    //print("===> count: ${resp.data.data.length}");
    return Result(resp.status, resp.data!.data??[], resp.message);
  }
}
