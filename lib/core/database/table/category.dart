import 'package:floor/floor.dart';

@entity
class Category {

  @primaryKey
  int id;
  final String name;
  final int parent;
  final String tags;

  Category(this.id, this.name, this.parent, this.tags);

}
