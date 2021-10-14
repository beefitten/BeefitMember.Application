import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

final String logoPath = "lib/shared/assets/images/logo.svg";

class Overview extends StatefulWidget {
  @override
  OverviewState createState() => OverviewState();
}

class OverviewState extends State<Overview>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        body: previewList,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[sliverBar];
        },
      ),
    );
  }
}

class AppBarCurve extends ShapeBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();

    path.moveTo(0, rect.height * 0.80);
    path.quadraticBezierTo(
        rect.width / 2, rect.height, rect.width, rect.height * 0.80);
    path.lineTo(rect.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}

final sliverBar = SliverAppBar(
    pinned: true,
    stretch: true,
    expandedHeight: 150.0,
    shape: AppBarCurve(),
    backgroundColor: Color.fromARGB(255, 2, 51, 199),
    bottom:
        PreferredSize(preferredSize: Size.fromHeight(30.0), child: Text('')),
    flexibleSpace: Stack(
      children: [
        // Center(
        //     child: SvgPicture.asset(
        //   logoPath,
        //   color: Colors.white,
        // )),
      ],
    ));

final previewList = Center(
  child: ListView(
    children: [
      Center(child: Text('data')),
      Center(child: TestWdiget()),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name)),
      Center(child: Text(FitnessPackage.name))
    ],
  ),
);

class TestWdiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('TestApp'));
  }
}
