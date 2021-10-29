import 'package:beefitmember_application/more/widgets/background_curve.dart';
import 'package:beefitmember_application/more/widgets/logout_btn.dart';
import 'package:beefitmember_application/more/widgets/membership_card.dart';
import 'package:beefitmember_application/more/widgets/membership_header.dart';
import 'package:beefitmember_application/more/widgets/more_widget.dart';
import 'package:beefitmember_application/more/widgets/profile_info.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
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
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    Stack(
                      children: [BackgroundCurve(), ProfileInfo()],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: MembershipHeader(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.02),
                      child: MemberShipCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: FitnessPackage.model.more.hasMoreMenu
                          ? MoreWidget()
                          : Container(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.02),
                      child: LogOutBtn(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
