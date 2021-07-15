import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manga/config/_routes.dart';
import 'package:money_manga/ui/pages/model_input_page/model_number_input_page.dart';

class SplashPage extends GetView<SplashPageController> {

  static final name = AppRoutes.splash;

  var _controller = SplashPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: _controller,
        initState: initState(),
        builder: (controller) => _body(),
      ));
  }

  Widget _body() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Money Manga",),
          ),
        ],
      ),
    );
  }

  initState() {
    _controller.init();
  }
}

class SplashPageController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 5));
    print("============");
    Get.offNamed(ModelNumberInputPage.name);
  }
}

