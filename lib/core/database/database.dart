import 'dart:async';

import 'package:floor/floor.dart';
import 'package:money_manga/core/database/dao/category_dao.dart';
import 'package:money_manga/core/database/table/category.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';


part 'database.g.dart';

@Database(version: 1, entities: [
  Category
])
abstract class AppDataBase extends FloorDatabase {
  CategoryDAO get categoryDAO;
}
