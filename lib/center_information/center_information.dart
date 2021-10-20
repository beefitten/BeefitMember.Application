import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_map.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class CenterInformation extends StatelessWidget {
  CenterInformation();

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
              TitleBanner('Center information'),
              Expanded(
                child: ListView(children: [
                  CenterInformationMap(),
                  CenterInformationBasic(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: TitleText('Location heat map'),
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
