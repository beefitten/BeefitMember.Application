import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointments_widget.dart';
import 'package:flutter/material.dart';

class PreviewBookings extends StatelessWidget {
  PreviewBookings();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(child: AppointmentsWidget()),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 3),
          child: ShowMore(),
        )
      ],
    );
  }
}
