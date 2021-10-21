import 'package:flutter/material.dart';

class BackgroundCurve extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 252, 1),
          borderRadius: new BorderRadius.vertical(
              bottom: new Radius.elliptical(
                  MediaQuery.of(context).size.width, 90))),
    );
  }
}