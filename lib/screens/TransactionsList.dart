import 'package:flutter/material.dart';
import 'package:flutter_cadastro/components/CenteredMessage.dart';
import 'package:flutter_cadastro/components/Progress.dart';
import 'package:flutter_cadastro/http/WebClient.dart';
import '../models/Transaction.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //transactions.add(Transaction(100.0, Contact(0, 'Alex', 1000)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction>? transactions = snapshot.data;
                if (transactions!.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions![index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            transaction.value.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            transaction.contact.accountNumber.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: transactions?.length,
                  );
                }
              }
              return CenteredMessage('No transcations found',
                  icon: Icons.warning);
              break;
          }
          return CenteredMessage('Unknown error', icon: Icons.error);
        },
      ),
    );
  }
}
