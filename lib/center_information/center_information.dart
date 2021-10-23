import 'package:beefitmember_application/bookings/services/booking_service.dart';
import 'package:beefitmember_application/center_information/service/center_information_service.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_map.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class CenterInformation extends StatefulWidget {
  CenterInformation();

  @override
  State<CenterInformation> createState() => _CenterInformationState();
}

class _CenterInformationState extends State<CenterInformation> {
  @override
  void initState() {
    CenterInformationService().getCenterInformation("hej");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              H1Text('Center information'),
              Expanded(
                child: ListView(children: [
                  CenterInformationMap(),
                  CenterInformationBasic(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: H2Text('Location heat map'),
                  ),
                  CenterInformationHeatMap(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
