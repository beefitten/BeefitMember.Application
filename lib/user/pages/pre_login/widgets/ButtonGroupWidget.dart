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
              child: PlaceholderButton(
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
                child: PlaceholderButton(
              "Facebook",
              () => {},
            )),
            Expanded(
                child: PlaceholderButton(
              "AppleID",
              () => {},
            )),
          ],
        ),
      ],
    );
  }
}

//TODO: Delete this when "lib/shared/widgets/button.dart" has been created
class PlaceholderButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String _text;

  PlaceholderButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ButtonTheme(
          child: TextButton(
            onPressed: this._onPressed,
            // onPressed: () => {Navigator.pushNamed(context, '/login')},
            child: Text(this._text),
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class PlaceholderButton_notImplemented extends StatelessWidget {
  const PlaceholderButton_notImplemented({Key? key}) : super(key: key);

  final String _regAccLabel = "Register Account";
  final String _tryAnother = "Try another email";
  final String _txt =
      "The Selected email was not found in the system. Do you want to register a new account or try another email?";

  displayDialog(context, regAccLabel, tryAnother, txt) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.only(
                top: 100.0, bottom: 250.0, left: 15.0, right: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Ups!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(txt),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  SizedBox(
                    width: 320.0,
                    height: 40.0,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      color: Color.fromRGBO(6, 62, 249, 1),
                      onPressed: () {},
                      child: Text(
                        regAccLabel,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 320.0,
                    height: 40.0,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      color: Color.fromRGBO(229, 235, 254, 1),
                      onPressed: () {},
                      child: Text(
                        tryAnother,
                        style: TextStyle(
                          color: Color.fromRGBO(6, 62, 249, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ButtonTheme(
          child: TextButton(
            onPressed: () =>
                {displayDialog(context, _regAccLabel, _tryAnother, _txt)},
            child: Text("Button"),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              elevation: 10,
            ),
          ),
        ),
      ),
    );
  }
}
