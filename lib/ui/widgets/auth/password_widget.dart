import 'package:flutter/material.dart';

Padding passwordInput(BuildContext context,
    TextEditingController _passwordController, bool _isObsecure) {
  return Padding(
      padding: EdgeInsets.only(top: 24),
      child: TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.emailAddress,
          obscureText: _isObsecure,
          decoration: InputDecoration(
            //hintText: 'Password...',
            icon: Icon(Icons.lock),
            labelText: 'Password',
            labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
            suffixIcon: IconButton(
              onPressed: () {
                _isObsecure = !_isObsecure;
                (context as Element).markNeedsBuild();
              },
              icon: Icon(
                _isObsecure ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          validator: ((String? value) {
            if (value == null || value/*!*/.isEmpty) {
              return 'Password is required';
            } else if (value.length < 6) {
              return "Password too short";
            } else {
              return null;
            }
          })));
}
