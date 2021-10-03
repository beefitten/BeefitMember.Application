import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/CarauselWidget.png";
    return Container(
      constraints: BoxConstraints.expand(
        height: 600.0,
      ),
      decoration: BoxDecoration(color: Colors.deepPurple),
      child: Image.asset(imagePath, fit: BoxFit.fitWidth),
    );
  }
}

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 400.0,
      ),
      decoration: BoxDecoration(color: Colors.grey),
      child: Image.asset(
        _assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
