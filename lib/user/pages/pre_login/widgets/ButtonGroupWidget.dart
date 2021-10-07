import 'package:flutter/material.dart';

class ButtonGroupWidget extends StatelessWidget {
  const ButtonGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: PlaceholderButton()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: PlaceholderButton_notImplemented()),
            Expanded(child: PlaceholderButton_notImplemented()),
          ],
        ),
      ],
    );
  }
}

//TODO: Delete this when "lib/shared/widgets/button.dart" has been created
class PlaceholderButton extends StatelessWidget {
  const PlaceholderButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ButtonTheme(
          child: TextButton(
            onPressed: () => {Navigator.pushNamed(context, '/login')},
            child: Text("Button"),
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

  final String _regAcc = "Register Account";
  final String _hint = "The Selected email was not found in the system. Do you want to register a new account or try another email?";
  displayDialog(context, textButtonOne, hintText){
    showDialog(
        context: context,
        builder: (context){
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText),
                  ),
                  SizedBox(
                    width: 320.0,
                    height: 40.0,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: Color.fromRGBO(6, 62, 249, 1),
                      onPressed: (){},
                      child: Text(_regAcc, style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),)
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
            onPressed: () => {displayDialog(context, _regAcc, _hint)},
            child: Text("Button"),
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
