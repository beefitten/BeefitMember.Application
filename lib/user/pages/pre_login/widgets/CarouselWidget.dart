import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  final images = [
    "lib/user/pages/pre_login/assets/tree.jpg",
    "lib/user/pages/pre_login/assets/plane.jpg",
    "lib/user/pages/pre_login/assets/jura.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 550,
          autoPlay: true,
          viewportFraction: 1,
        ),
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) {
          final image = images[index];
          return buildImage(image, index);
        },
      ),
    );
  }

  Widget buildImage(String image, int index) => Container(
        //margin: EdgeInsets.symmetric(horizontal: 1),
        color: Colors.grey,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      );
}
