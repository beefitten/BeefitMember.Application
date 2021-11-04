import 'package:beefitmember_application/more/widgets/background_curve.dart';
import 'package:beefitmember_application/more/widgets/logout_btn.dart';
import 'package:beefitmember_application/more/widgets/membership_card.dart';
import 'package:beefitmember_application/more/widgets/membership_header.dart';
import 'package:beefitmember_application/more/widgets/more_widget.dart';
import 'package:beefitmember_application/more/widgets/profile_info.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/statics/get_padding.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [BackgroundCurve(), ProfileInfo()],
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Padding(
                padding:
                    EdgeInsets.only(left: getPadding(), right: getPadding()),
                child: ListView(
                  children: [
                    MembershipHeader(),
                    MemberShipCard(),
                    FitnessPackage.model.more.hasMoreMenu
                        ? MoreWidget()
                        : Container(),
                    LogOutBtn()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
