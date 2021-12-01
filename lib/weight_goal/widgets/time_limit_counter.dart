import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:beefitmember_application/weight_goal/widgets/plus_minus_counter.dart';
import 'package:flutter/material.dart';

class TimeLimitCounter extends StatefulWidget {
  const TimeLimitCounter();

  @override
  _TimeLimitCounterState createState() => _TimeLimitCounterState();
}

class _TimeLimitCounterState extends State<TimeLimitCounter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        H3Text("Enable time limit"),
        DescriptionText(
            "If you enable time limit this goal will become a weekly weight loss goal as well. NOT IMPLEMENTED"),
        PlusMinusCounter(onChanged: (x) => {x}),
      ],
    );
  }
}
