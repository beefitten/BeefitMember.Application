import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointments_widget.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class PreviewBookings extends StatefulWidget {
  final showMore;

  PreviewBookings(this.showMore);

  @override
  State<PreviewBookings> createState() => _PreviewBookingsState();
}

class _PreviewBookingsState extends State<PreviewBookings> {
  @override
  Widget build(BuildContext context) {
    final _showMore = widget.showMore;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            H1Text(
              "Your Appointments",
            ),
            _showMore == true ? ShowMore() : Container(),
          ],
        ),
        AppointmentsWidget(),
      ],
    );
  }
}
