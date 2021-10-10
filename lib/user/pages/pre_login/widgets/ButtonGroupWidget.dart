import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ButtonGroupWidget extends StatelessWidget {
  const ButtonGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  "Sign in with e-mail",
                  () => {Navigator.pushNamed(context, '/login')},
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomIconButton(
                  Icons.facebook_sharp,
                  () => {},
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomIconButton(
                  Icons.alarm,
                  () => {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
