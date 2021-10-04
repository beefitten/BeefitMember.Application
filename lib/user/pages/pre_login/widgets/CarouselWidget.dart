import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/testPicure.png";
    return Container(
      constraints: BoxConstraints.expand(
        height: 600.0,
      ),
      decoration: BoxDecoration(color: Colors.deepPurple),
      child: Image.asset(imagePath, fit: BoxFit.fitWidth),
    );
  }
}
