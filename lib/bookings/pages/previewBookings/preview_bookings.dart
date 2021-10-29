import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointments_widget.dart';
import 'package:flutter/material.dart';

class PreviewBookings extends StatelessWidget {
  PreviewBookings();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your Appointments",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            ShowMore(),
          ],
        ),
        AppointmentsWidget(),
      ],
    );
  }
}
