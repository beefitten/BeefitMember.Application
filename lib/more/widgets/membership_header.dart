import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:flutter/material.dart';

class MembershipHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final headerGeneral = (String txt) => Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.44),
          child: Text(
            "$txt",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );

    return Container(
      child: Row(
        children: [headerGeneral("Membership"), ShowMore()],
      ),
    );
  }
}