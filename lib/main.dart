import 'package:flutter/material.dart';
import 'package:flutter_cadastro/http/WebClient.dart';
import 'package:flutter_cadastro/models/Contact.dart';
import 'package:flutter_cadastro/screens/ContactsList.dart';
import 'package:flutter_cadastro/screens/Dashboard.dart';

import 'database/AppDatabase.dart';

void main() {
  runApp(BancoDigio());
  // save(Contact(0, 'Vitor', 23456)).then((id) {
  // findAll().then((contacts) => debugPrint(contacts.toString()));
  //});

  findAll().then((transactions) => print('new transactions $transactions'));
}

class BancoDigio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.blueAccent[700]),
      ),
      home: Dashboard(),
    );
  }
}
