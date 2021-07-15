import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:money_manga/config/_colors.dart';
import 'package:money_manga/config/_routes.dart';
import 'package:money_manga/ui/pages/spending/spending_list_controller.dart';

class SpendingListPage extends GetView<SpendingListController> {

  static final name = AppRoutes.spendingList;
  var _controller= SpendingListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: GetBuilder(
        init: _controller,
        builder: (controller) => _body(),
      ));
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      title: Expanded(child: Text("Money Manga")),
    );
  }

  Widget _body() {
    return Container(
        child: controller.list.isEmpty
            ? _emptyView()
            : ListView.builder(
                      //itemCount: controller.list.length,
                      itemCount: 40,
                      itemBuilder: (context, i) => _listItem()),
                );
  }

  Widget _emptyView() {
    return Container(child: Text("No items found"));
  }

  Widget _listItem() {
    return InkWell(
        onTap: () {},
        hoverColor: AppColors.redTransparent,
        highlightColor: AppColors.redTransparent1,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: AppColors.redTransparent1,
              width: 1.0,
            ),
          )),
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(child: _data()),
              Padding(padding: EdgeInsets.all(4.0)),
              _price()
            ],
          ),
        ));
  }

  Widget _data() {
    return Column(
      children: [
        Container(
            width: double.infinity,
            child: Text(
              "Isuka khkhlk ",
              style: TextStyle(fontSize: 20),
            )),
        Padding(padding: EdgeInsets.all(4.0)),
        Row(
          children: [
            _date(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              color: AppColors.red,
              width: 2.0,
              child: Text(""),
            ),
            _tags()
          ],
        ),
      ],
    );
  }

  Widget _date() {
    return Text("12/5/2021", style: TextStyle(color: Colors.indigo));
  }

  Widget _tags() {
    return Text("Acc1, acc2, add2, ghsfh");
  }

  Widget _price() {
    return Text("300",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.red));
  }
}
