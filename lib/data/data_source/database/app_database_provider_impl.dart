import 'package:injectable/injectable.dart';
import 'package:mobile_news_with_bloc/domain/modules/article.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database_provider.dart';

@LazySingleton(as: AppDatabaseProvider)
class AppDatabaseProviderImpl extends AppDatabaseProvider {
  static final AppDatabaseProviderImpl _databaseService =
      AppDatabaseProviderImpl._internal();

  factory AppDatabaseProviderImpl() => _databaseService;

  AppDatabaseProviderImpl._internal();

  static Database? _database;

  AppDatabaseProviderImpl._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final getDirectory = await getApplicationDocumentsDirectory();
    String path = '${getDirectory.path}/article.db';
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Article(id TEXT PRIMARY KEY Not null, author TEXT, title TEXT, description TEXT, url TEXT, urlToImage TEXT, published  TEXT, content TEXT, sourceName TEXT, sourceId TEXT, isFavourite INTEGER)');
  }

  @override
  Future<void> addFavoriteArticle(Article article) async {
    final db = await _databaseService.database;
    await db.rawInsert(
        'INSERT OR REPLACE INTO Article(id, author, title, description,url,urlToImage ,published, content,sourceName ,sourceId,isFavourite) VALUES(?,?,?,?,?,?,?,?,?,?,?)',
        [
          article.id,
          article.author,
          article.title,
          article.description,
          article.url,
          article.urlToImage,
          article.publishedAt.toString(),
          article.content,
          article.sourceName,
          article.sourceId,
          article.isFavourite
        ]);
  }

  @override
  Future<List<Article>> getArticles() async {
    try {
      final db = await _databaseService.database;
      var data = await db.rawQuery('SELECT * FROM Article');
      List<Article> articles =
          List.generate(data.length, (index) => Article.fromJson(data[index]));
      return articles;
    } catch (e) {
      return List.empty();
    }
  }

  @override
  Future<void> removeFavoriteArticle(Article article) async {
    final db = await _databaseService.database;
    await db.rawDelete('DELETE FROM Test WHERE id = ?', [article.id]);
  }
}
