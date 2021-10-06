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
            Expanded(child: PlaceholderButton()),
            Expanded(child: PlaceholderButton()),
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
            onPressed: () => {},
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
