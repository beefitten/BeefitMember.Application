import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointmentswidget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/bookingswidget.dart';
import 'package:flutter/material.dart';

class PreviewBookings extends StatelessWidget {
  late Color _color;

  PreviewBookings([this._color = Colors.white]);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
            child: AppointmentsWidget(Color.fromARGB(255, 247, 247, 252))),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 3),
          child: ShowMore(),
        )
      ],
    );
  }
}
