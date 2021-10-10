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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomButton(
                    "Sign in with e-mail",
                    () => {Navigator.pushNamed(context, '/login')},
                  ),
                ),
              ),
            ],
          ),
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
