import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;

  Progress({this.message = 'Progress'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(message),
        ],
      ),
    );
  }
}
