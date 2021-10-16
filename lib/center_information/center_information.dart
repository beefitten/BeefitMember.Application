import 'package:beefitmember_application/bookings/pages/previewBookings/preview_bookings.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_map.dart';
import 'package:beefitmember_application/training_progression/preview/training_prog_preview.dart';
import 'package:flutter/material.dart';

class CenterInformation extends StatelessWidget {
  CenterInformation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: CenterInformationBasic(),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CenterInformationMap(),
          ),
          Container(
            child: PreviewBookings(),
          )
        ],
      ),
    );
  }
}
