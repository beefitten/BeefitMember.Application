
import 'package:beefitmember_application/user/pages/login/login_form.dart';
import 'package:flutter/material.dart';
import 'navigation/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beefit Member',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Nav(),
    );
  }
}
