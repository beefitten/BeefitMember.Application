import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:flutter/material.dart';

class PlusMinusCounter extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  const PlusMinusCounter({
    Key? key,
    this.minValue = 1,
    this.maxValue = 443,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PlusMinusCounterState createState() => _PlusMinusCounterState();
}

class _PlusMinusCounterState extends State<PlusMinusCounter> {
  var counter = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            Icons.remove,
            () => {
              setState(() {
                if (counter > widget.minValue) {
                  counter--;
                }
                widget.onChanged(counter);
              }),
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$counter",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("KG")
            ],
          ),
          CustomIconButton(
            Icons.add,
            () => {
              setState(() {
                if (counter < widget.maxValue) {
                  counter++;
                }
                widget.onChanged(counter);
              }),
            },
          ),
        ],
      ),
    );
  }
}
