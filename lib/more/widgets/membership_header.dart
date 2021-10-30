import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:flutter/material.dart';

class MembershipHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Membership",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ShowMore()
        ],
      ),
    );
  }
}
