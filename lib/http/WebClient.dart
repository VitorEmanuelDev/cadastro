import 'dart:convert';
import 'package:flutter_cadastro/models/Transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/Contact.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url ${data.url}');
    print('body ${data.body}');
    print('headers ${data.headers}');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code ${data.statusCode}');
    print('body ${data.body}');
    print('headers ${data.headers}');

    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  Uri responseUri = Uri.parse('http://192.168.0.17:8080/transactions');

  final Response response =
      await client.get(responseUri).timeout(Duration(seconds: 5));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = List.empty(growable: true);

  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );

    transactions.add(transaction);
  }
  return transactions;
}
