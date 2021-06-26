
import 'package:floor/floor.dart';
import 'package:money_manga/core/database/table/category.dart';

@dao
abstract class CategoryDAO{

  @Query('SELECT * FROM category WHERE id = :id')
  Future<List<Category>> list( String id);

  @Query('SELECT * FROM category WHERE name =%:search%')
  Future<List<Category>> search( String search);

  @insert
  Future<void> insertCategory(Category category);

  @insert
  Future<void> insertCategories(List<Category> products);

  @update
  Future<void> updateCategory(Category product);

  @update
  Future<void> updateCategories(List<Category> product);

  @delete
  Future<void> deleteCategory(Category product);

  @delete
  Future<void> deleteCategories(List<Category> products);

}