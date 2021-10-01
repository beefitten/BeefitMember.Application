import 'package:beefitmember_application/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextFieldInput('Username', 200.0),
          TextFieldInput('Password', 200.0)
        ],
      ),
    );
  }
}
