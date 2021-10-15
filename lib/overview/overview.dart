import 'package:beefitmember_application/bookings/pages/previewBookings/preview_bookings.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointmentswidget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/bookingswidget.dart';
import 'package:beefitmember_application/overview/widgets/parallax_app_bar.dart';
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
        body: ScrollConfiguration(behavior: ScrollSetup(), child: previewList),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[ParallaxAppBar(logoPath)];
        },
      ),
    );
  }
}

class ScrollSetup extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

final previewList = Center(
    child: ListView(
  children: [PreviewBookings(), PreviewBookings()],
));
