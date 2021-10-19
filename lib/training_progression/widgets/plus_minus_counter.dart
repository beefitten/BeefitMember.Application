import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:flutter/material.dart';

class PlusMinusCounter extends StatefulWidget {
  const PlusMinusCounter({Key? key}) : super(key: key);

  @override
  _PlusMinusCounterState createState() => _PlusMinusCounterState();
}

class _PlusMinusCounterState extends State<PlusMinusCounter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(Icons.remove, () => {}),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "80.4",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("KG")
            ],
          ),
          CustomIconButton(Icons.add, () => {}),
        ],
      ),
    );
  }
}
