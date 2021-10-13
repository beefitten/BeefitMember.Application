
import 'package:beefitmember_application/overview/pages/overview/overview.dart';
import 'package:flutter/material.dart';

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
      home:  new Overview(),
    );
  }
}
