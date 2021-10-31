import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointments_widget.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Text(
              "Your Appointments",
              textAlign: TextAlign.left,
              style: GoogleFonts.getFont(
                FitnessPackage.model.font.generalFont,
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            _showMore == true ? ShowMore() : Container(),
          ],
        ),
        AppointmentsWidget(),
      ],
    );
  }
}
