import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{
  static const DBname = "tododb.db";
  static const _databaseVersion = 1;
  static const notestable = 'notes';
  late Database _db;
  Future<void> init() async{
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, DBname);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $notestable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title VARCHAR(30) NOT NULL,
            decription VARCHAR(70)
          );
          ''');
  }
  Future<int> insertNote(Map<String, dynamic> row) async {
    return await _db.insert(notestable, row,conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAllNotes() async {
    return await _db.query(notestable);
  }

  Future<int> delete(int id) async {
    return await _db.delete(
      notestable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}