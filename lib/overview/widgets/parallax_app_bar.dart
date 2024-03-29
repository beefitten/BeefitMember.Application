import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_bar_curve.dart';

class ParallaxAppBar extends StatelessWidget {
  ParallaxAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        pinned: true,
        automaticallyImplyLeading: false,
        stretch: true,
        expandedHeight: 150.0,
        shape: AppBarCurve(),
        backgroundColor: Color(int.parse(FitnessPackage.model.primaryColor)),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0), child: Text('')),
        flexibleSpace: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                  child: Image.network(FitnessPackage.model.logo, height: 50)),
            ),
          ],
        ));
  }
}
