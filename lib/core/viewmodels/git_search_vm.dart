import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:money_manga/core/database/table/_repository.dart';
import 'package:money_manga/core/network/datasource/git_datasource.dart';

class GitSearchViewModel extends ChangeNotifier {
  final GitDataSource _gitDataSource = Get.find<GitDataSource>();
  List<Repository> list = [];

  Future<void> getList() async {
    var resp = await _gitDataSource.search("flutter");
    if (resp.data != null && resp.data!.data != null) {
      list = [];
      resp.data!.data!.forEach((element) {
        list.add(element);
      });
      notifyListeners();
    }
  }
}
