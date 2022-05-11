import 'dart:convert';
import 'package:flutter_cadastro/models/Transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/Contact.dart';
import 'interceptors/LoggingInterceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 5),
);
Uri baseUrl = Uri.parse('http://192.168.0.17:8080/transactions');
