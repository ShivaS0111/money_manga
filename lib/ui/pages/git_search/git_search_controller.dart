import 'package:get/get.dart';
import 'package:money_manga/core/database/table/_repository.dart';
import 'package:money_manga/core/network/datasource/git_datasource.dart';

class GitSearchController extends GetxController {
  final GitDataSource _gitDataSource = Get.find<GitDataSource>();
  List<Repository> list = [];
  @override
  void onInit() {
    super.onInit();
    getList("flutter");
  }

  Future<void> getList(String searchTerm) async {
    list = [];
    update();
    var resp = await _gitDataSource.search(searchTerm);
    if (resp.data != null && resp.data!.data != null) {
      list = resp.data?.data ?? [];
      update();
    }
  }
}
