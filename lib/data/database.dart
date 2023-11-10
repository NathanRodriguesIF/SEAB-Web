import 'package:seab/data/dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'database.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(Dao.usuario);
    db.execute(Dao.sms);
    db.execute(Dao.logado);
  }, version: 1);
}
