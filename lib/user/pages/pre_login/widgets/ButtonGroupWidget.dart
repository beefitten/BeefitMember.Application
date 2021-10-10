import 'package:flutter/material.dart';

class ButtonGroupWidget extends StatelessWidget {
  const ButtonGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomButton(
                "Facebook",
                () => {},
              ),
            ),
            Expanded(
              child: CustomButton(
                "AppleID",
                () => {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//TODO: Delete this when "lib/shared/widgets/button.dart" has been created
class CustomButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String _text;

  CustomButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: this._onPressed,
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(6, 62, 249, 1),
        textColor: Colors.white,
        child: Text(this._text),
      ),
    );
  }
}
