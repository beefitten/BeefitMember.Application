import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final images = [
    "lib/user/pages/pre_login/assets/tree.jpg",
    "lib/user/pages/pre_login/assets/plane.jpg",
    "lib/user/pages/pre_login/assets/jura.png",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 550,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            final image = images[index];
            return buildImage(image, index);
          },
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: buildIndicator(),
        ),
      ],
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

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
      );
}
