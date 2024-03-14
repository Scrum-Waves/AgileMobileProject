import 'package:flutter/material.dart';

TextFormField emailInput(
    BuildContext context, TextEditingController _emailController) {
  return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        //hintText: 'Email',
        prefixIcon: Icon(Icons.mail),
        labelText: 'Email',
        labelStyle: TextStyle(
            color: (Theme.of(context).brightness.name == Brightness.light.name)
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).primaryTextTheme.bodyText2?.color),
      ),
      validator: ((String? value) {
        if (value == null || value/*!*/.isEmpty) {
          return "Email is required";
        } else if (value.length < 5 ||
            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return "Please enter a valid email";
        }
        return null;
      }));
}
