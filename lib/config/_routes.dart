import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:money_manga/ui/pages/git_search/git_search_page.dart';
import 'package:money_manga/ui/pages/spending/spending_list_page.dart';
import 'package:money_manga/ui/pages/splash/splash_page.dart';

import '../middleware.dart';


class AppRoutes {
  static const main = '/';
  static const splash = '/splash';
  static const spendingList = '/spending-list';
  static const category = '/category';
  static const git_search = '/git_search';

  _() {}
  static AppRoutes? _instance;
  static AppRoutes get instance => _instance!;
  factory AppRoutes() => _instance = AppRoutes()._();

  static  appRoutes() => [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: spendingList, page: () => SpendingListPage()),
    GetPage(name: git_search, page: () => GitSearchPage()),
    GetPage(
        name: category,
        page: () => SpendingListPage(),
        transition: Transition.zoom
    ),
  ];

  static navigateObservers() {
    var list =<NavigatorObserver>[];
    var obs = MiddleWare.observer;
    if( obs!=null){
    }
    return list;
  }


}

