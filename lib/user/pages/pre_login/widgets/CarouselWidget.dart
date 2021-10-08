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
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: CarouselSlider.builder(
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
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Track your \n activities",
                  textScaleFactor: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: buildIndicator(),
        ),
      ],
    );
  }

  Widget buildImage(String image, int index) => Container(
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

class CurveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.conicTo(
      size.width * 0.8,
      size.height * 1.2,
      size.width,
      size.height * 0.8,
      0.3,
    );
    // path.relativeConicTo(
    //   0,
    //   size.height * 0.1,
    //   size.width * 0.8,
    //   size.height * 0.3,
    //   1.75,
    // );
    // path.lineTo(size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
