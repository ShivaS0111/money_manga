import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manga/config/resource_constants.dart';
import 'package:money_manga/ui/pages/login/login_page.dart';

/// Initialize program in this page.
/// eg. Permission check, Login token check...
class SplashPage extends StatelessWidget {

  static final name = '/splash';

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 5), () {
      Get.off(LoginPage(), transition: Transition.fade);
    });

    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Hero(
                tag: logo_path,
                child: Image.asset(logo_path, fit: BoxFit.contain,),
              ),
            ),
            // TODO Any info to display.. (eg. Version, contact, ....)
          ],
        ),
      ),
    );
  }
}

