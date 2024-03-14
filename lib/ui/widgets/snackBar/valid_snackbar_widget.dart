import 'package:flutter/material.dart';

SnackBar ValidSnackBar(String _message) {
  return SnackBar(
    content: Text(_message, style: TextStyle(fontSize: 16.0)),
    action: SnackBarAction(
      label: "OK",
      textColor: Colors.white,
      onPressed: () {},
    ),
    backgroundColor: Colors.green,
  );
}
