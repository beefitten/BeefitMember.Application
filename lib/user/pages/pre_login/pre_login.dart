import 'package:flutter/material.dart';
import 'widgets/CarouselWidget.dart';
import 'widgets/ButtonGroupWidget.dart';

class PreLogin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CarouselWidget(),
          ButtonGroupWidget(),
        ],
      ),
    );
  }
}
