import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_bar_curve.dart';

class ParallaxAppBar extends StatelessWidget {
  final _logo;

  ParallaxAppBar(this._logo);

  @override
  Widget build(BuildContext context) {
    return     SliverAppBar(
          pinned: true,
          stretch: true,
          expandedHeight: 150.0,
          shape: AppBarCurve(),
          backgroundColor: Color.fromARGB(255, 2, 51, 199),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Text('')),
          flexibleSpace: Stack(
            children: [
              Center(child: SvgPicture.asset(
                _logo, 
                color: Colors.white,)),
            ],
          )
        );
  }
}