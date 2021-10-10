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

//TODO: Move this to SharedWidgets and convince group to start using
class CustomButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String _text;

  CustomButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: this._onPressed,
      padding: EdgeInsets.all(20),
      color: Color.fromRGBO(6, 62, 249, 1),
      textColor: Colors.white,
      child: Text(this._text),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData _icon;
  final VoidCallback _onPressed;

  CustomIconButton(this._icon, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: this._onPressed,
        color: Colors.white,
        textColor: Colors.black,
        child: IconButton(
          icon: Icon(this._icon),
          onPressed: this._onPressed,
          iconSize: 35,
        ),
      ),
    );
  }
}
