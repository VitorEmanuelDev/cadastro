import 'package:flutter/material.dart';
import 'package:flutter_cadastro/components/TransactionAuthDialog.dart';
import 'package:flutter_cadastro/http/WebClient.dart';
import 'package:flutter_cadastro/models/Contact.dart';
import 'package:flutter_cadastro/screens/ContactsList.dart';
import 'package:flutter_cadastro/screens/Dashboard.dart';
import 'package:uuid/uuid.dart';

import 'database/AppDatabase.dart';
import 'models/Transaction.dart';

void main() {
  runApp(BancoDigio());
  //save(Transaction(500.0, Contact(0, 'teste', 2000)))
  //  .then((transaction) => print(transaction));
  // findAll().then((transactions) => print('new transactions $transactions'));
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
      // home: TransactionAuthDialog(),
    );
  }
}
