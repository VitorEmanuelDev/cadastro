import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  TransactionAuthDialog({
    required this.onConfirm,
  });

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Authenticate'),
        content: TextField(
          obscureText: true,
          controller: _passwordController,
          maxLength: 4,
          textAlign: TextAlign.center,
          //keyboardType: TextInputType.number,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(fontSize: 32, letterSpacing: 16),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('cancel'),
          ),
          TextButton(
            onPressed: () {
              widget.onConfirm(_passwordController.text);
              Navigator.of(context).pop();
            },
            child: Text('confirm'),
          )
        ]);
  }
}
