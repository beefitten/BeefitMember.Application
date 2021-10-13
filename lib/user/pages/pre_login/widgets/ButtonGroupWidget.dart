import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ButtonGroupWidget extends StatelessWidget {
  const ButtonGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: CustomButton(
                    "Sign in with e-mail",
                    () => {Navigator.pushNamed(context, '/login')},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomIconButton(
                    Icons.facebook_sharp,
                    () => {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.015,
                ),
                Expanded(
                  child: CustomIconButton(
                    Icons.alarm,
                    () => {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
