import 'package:flutter_cadastro/database/dao/ContactDAO.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/*Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'digioBank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
    //retirar ondowngrade caso seja código a ser usado em ambiente de homologacao/producao
  });
}*/

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'digioBank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDAO.tableSql);
    },
    version: 1,
  );
}
