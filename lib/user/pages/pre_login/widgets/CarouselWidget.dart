import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = "lib/user/pages/pre_login/assets/testPicure.png";
    return Container(
      constraints: BoxConstraints.expand(
        height: 500,
      ),
      decoration: BoxDecoration(color: Colors.deepPurple),
      child: Image.asset(imagePath, fit: BoxFit.fitWidth),
    );
  }
}
