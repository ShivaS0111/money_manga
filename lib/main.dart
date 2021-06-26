import 'package:flutter/material.dart';
import 'package:money_manga/app.dart';
import 'config/environment.dart';
import 'locator.dart';

Future<void> main() async {
  Environment(buildType:BuildType.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MoneyMangaApp());
}
