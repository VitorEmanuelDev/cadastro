import 'package:sqflite/sqflite.dart';

import '../../models/Contact.dart';
import '../AppDatabase.dart';

class ContactDAO {
/*Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });
}*/

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert('$_tableName', contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['$_name'] = contact.name;
    contactMap['$_accountNumber'] = contact.accountNumber;
    return contactMap;
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
    final List<Map<String, dynamic>> mapsList = await db.query('$_tableName');
    List<Contact> contacts = _toList(mapsList);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> mapsList) {
    final List<Contact> contacts = List.empty(growable: true);
    for (Map<String, dynamic> row in mapsList) {
      final Contact contact = Contact(
        row[_id] ?? 0,
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
