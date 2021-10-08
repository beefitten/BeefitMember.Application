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
          Expanded(child: ButtonGroupWidget()),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "By continuing you agree to Beefits Terms of Service \n and Privacy Policy",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
