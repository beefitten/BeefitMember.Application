import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class CenterInformationPreview extends StatelessWidget {
  CenterInformationPreview();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            H2Text('Center informations'),
            ShowMore(),
          ],
        ),
        Card(
          elevation: double.parse(FitnessPackage.model.elevation),
          child: CenterInformationBasic(),
        )
      ],
    );
  }
}
