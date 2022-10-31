import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;

  /// Tabel User
  String mFavoritTable = 'favorite';
  String mId = 'id';
  String mLanguage = 'original_language';
  String mOriTitle = 'original_title';
  String mOverview = 'overview';
  String mReleaseDate = 'release_date';
  String mTitle = 'title';
  String mPoster = 'poster_path';
  String mBackDrop = 'backdrop_path';
  String mVoteAverage = 'vote_average';

  /// named constructor to create database instance
  DbHelper._createInstance();

  /// singleton, only initialize one entire lifecycle
  factory DbHelper() {
    _dbHelper ??= DbHelper._createInstance();
    return _dbHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializedDatabase();

    return _database!;
  }

  void createDb(Database db, int version) async {
    await db.execute('CREATE TABLE $mFavoritTable ()');
  }

  Future<Database> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = '${directory.path}/incinema_apps.db';
    // print(path);
    var savingDb = await openDatabase(path, version: 1, onCreate: createDb);

    return savingDb;
  }
}
