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
          alignment: Alignment.topLeft,
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.6,
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
            Positioned(
              // bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Track your \n activities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height *
                          0.04, //Scales text to screensize. Adjust the integer to adjust size
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 10, bottom: 10),
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
    path.lineTo(0, 0);
    path.cubicTo(0, 0, 0, size.height * 0.69, 0, size.height * 0.69);
    path.cubicTo(0, size.height * 0.79, size.width * 0.66, size.height,
        size.width * 0.73, size.height);
    path.cubicTo(size.width * 0.8, size.height, size.width, size.height * 0.94,
        size.width, size.height * 0.94);
    path.cubicTo(size.width, size.height * 0.94, size.width, size.height * 0.3,
        size.width, 0);
    path.cubicTo(size.width, 0, 0, 0, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
