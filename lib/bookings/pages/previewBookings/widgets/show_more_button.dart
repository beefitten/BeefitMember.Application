import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ShowMore extends StatelessWidget {
  ShowMore();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTextButton(
        "Show more",
        () => {Navigator.pushNamed(context, '/bookings')},
      ),
    );
  }
}
