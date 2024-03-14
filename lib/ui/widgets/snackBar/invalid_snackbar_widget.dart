import 'package:flutter/material.dart';

SnackBar InvalidSnackBar(String _message) {
  return SnackBar(
    content: Text(_message, style: TextStyle(fontSize: 16.0)),
    action: SnackBarAction(
      label: "Not Valid!",
      textColor: Colors.white,
      onPressed: () {},
    ),
    backgroundColor: Colors.red,
  );
}
