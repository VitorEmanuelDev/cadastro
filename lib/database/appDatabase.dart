import 'package:flutter_cadastro/models/Contact.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

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
  final String dbPath = await getDatabasesPath() as String;
  final String path = join(dbPath, 'digioBank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete
  );
}

/*Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });
}*/

Future<int> save(Contact contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return db.insert('contacts', contactMap);
}

/*Future<List<Contact>> findAll() {
  return getDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = List.empty(growable: true);
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'] ?? 0,
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}*/

Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> mapsList = await db.query('contacts');

  final List<Contact> contacts = List.empty(growable: true);
  for (Map<String, dynamic> row in mapsList) {
    final Contact contact = Contact(
      row['id'] ?? 0,
      row['name'],
      row['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
}
