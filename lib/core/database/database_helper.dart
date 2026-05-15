import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('kelime_oyunu.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Users (
        UserID INTEGER PRIMARY KEY AUTOINCREMENT,
        UserName TEXT NOT NULL,
        Password TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE Words (
        WordID INTEGER PRIMARY KEY AUTOINCREMENT,
        EngWordName TEXT NOT NULL,
        TurWordName TEXT NOT NULL,
        Picture TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE WordSamples (
       WordSamplesID INTEGER PRIMARY KEY AUTOINCREMENT,
       WordID INTEGER NOT NULL,
       Samples TEXT NOT NULL,
       FOREIGN KEY (WordID) REFERENCES Words (WordID)
      )
    ''');
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }

  
}