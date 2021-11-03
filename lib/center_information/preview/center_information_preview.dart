import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_heatmap.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class CenterInformationPreview extends StatelessWidget {
  final CenterInformationModel model;

  CenterInformationPreview(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            H2Text('Center information'),
            ShowMore(),
          ],
        ),
        CenterInformationHeatMap(model)
      ],
    );
  }
}
