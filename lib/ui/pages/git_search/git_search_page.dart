import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manga/config/_colors.dart';
import 'package:money_manga/config/_routes.dart';
import 'package:money_manga/core/database/table/_repository.dart';
import 'package:money_manga/ui/pages/git_search/git_search_controller.dart';

class GitSearchPage extends GetView<GitSearchController> {
  static final name = AppRoutes.git_search;
  var _controller = GitSearchController();

  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: GetBuilder(
          init: _controller,
          builder: (controller) => Column(
            children: [_inputbox(), Expanded(child: _listing())],
          ),
        ));
  }

  Widget _listing() {
    if (controller.list.length > 0)
      return ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (context, i) => InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.spendingList);
              },
              child: _listItem(controller.list[i])));
    else
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 15,
              ),
              Text("Loading"),
            ],
          ),
        ),
      );
  }

  Widget _listItem(Repository repo) => Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      color: AppColors.redTransparent,
      child: Text("" +
          (repo.name ?? '') +
          "(" +
          (repo.language ?? '') +
          ") by " +
          (repo.username ?? '') +
          " "
              "\nfollowers:" +
          (repo.followers ?? 0).toString() +
          "\nUrl" +
          (repo.url ?? '')));

  Widget _inputbox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.red, // set border color
            width: 2.0), // set border width
        borderRadius:
            BorderRadius.all(Radius.circular(4.0)), // set rounded corner radius
      ),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _inputController,
            decoration: InputDecoration(
              hintText: 'Label text',
              border: InputBorder.none,
            ),
          )),
          InkWell(
            onTap: () {
              search();
            },
            child: SizedBox(
              width: 20,
              height: 20,
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }

  void search() {
    var input = _inputController.text.toString();
    controller.getList(input);
  }
}
