import 'package:floor/floor.dart';

@entity
class Spending {
  
  @primaryKey
  int id;
  final String name;
  final int categoryId;
  final int accountId;
  final String tags;
  final DateTime date;

  Spending(this.id, this.name, this.categoryId, this.accountId, this.tags, this.date);

}