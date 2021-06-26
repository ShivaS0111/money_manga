// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder databaseBuilder(String name) =>
      _$AppDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseBuilder(null);
}

class _$AppDataBaseBuilder {
  _$AppDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBase extends AppDataBase {
  _$AppDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CategoryDAO? _categoryDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Category` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `parent` INTEGER NOT NULL, `tags` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CategoryDAO get categoryDAO {
    return _categoryDAOInstance ??= _$CategoryDAO(database, changeListener);
  }
}

class _$CategoryDAO extends CategoryDAO {
  _$CategoryDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _categoryInsertionAdapter = InsertionAdapter(
            database,
            'Category',
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'parent': item.parent,
                  'tags': item.tags
                }),
        _categoryUpdateAdapter = UpdateAdapter(
            database,
            'Category',
            ['id'],
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'parent': item.parent,
                  'tags': item.tags
                }),
        _categoryDeletionAdapter = DeletionAdapter(
            database,
            'Category',
            ['id'],
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'parent': item.parent,
                  'tags': item.tags
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Category> _categoryInsertionAdapter;

  final UpdateAdapter<Category> _categoryUpdateAdapter;

  final DeletionAdapter<Category> _categoryDeletionAdapter;

  @override
  Future<List<Category>> list(String id) async {
    return _queryAdapter.queryList('SELECT * FROM category WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Category(row['id'] as int,
            row['name'] as String, row['parent'] as int, row['tags'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Category>> search(String search) async {
    return _queryAdapter.queryList('SELECT * FROM category WHERE name =%?1%',
        mapper: (Map<String, Object?> row) => Category(row['id'] as int,
            row['name'] as String, row['parent'] as int, row['tags'] as String),
        arguments: [search]);
  }

  @override
  Future<void> insertCategory(Category category) async {
    await _categoryInsertionAdapter.insert(category, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertCategories(List<Category> products) async {
    await _categoryInsertionAdapter.insertList(
        products, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCategory(Category product) async {
    await _categoryUpdateAdapter.update(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCategories(List<Category> product) async {
    await _categoryUpdateAdapter.updateList(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCategory(Category product) async {
    await _categoryDeletionAdapter.delete(product);
  }

  @override
  Future<void> deleteCategories(List<Category> products) async {
    await _categoryDeletionAdapter.deleteList(products);
  }
}
