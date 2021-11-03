import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointments_widget.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class YourAppointmentsPreview extends StatefulWidget {
  final showMore;

  YourAppointmentsPreview(this.showMore);

  @override
  State<YourAppointmentsPreview> createState() =>
      _YourAppointmentsPreviewState();
}

class _YourAppointmentsPreviewState extends State<YourAppointmentsPreview> {
  @override
  Widget build(BuildContext context) {
    final _showMore = widget.showMore;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            H2Text("Your Appointments"),
            _showMore == true ? ShowMore() : Container(),
          ],
        ),
        AppointmentsWidget(),
      ],
    );
  }
}
