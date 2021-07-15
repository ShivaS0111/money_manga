import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/_routes.dart';
import 'config/environment.dart';
import 'config/theme_constants.dart';

class MoneyMangaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: !Environment.instance.isProduction,
      title: 'Sample',
      theme: myTheme,
      initialRoute: AppRoutes.git_search,
      getPages: AppRoutes.appRoutes(),
      navigatorKey: Get.key,
      navigatorObservers: AppRoutes.navigateObservers(),
    );
  }
}
