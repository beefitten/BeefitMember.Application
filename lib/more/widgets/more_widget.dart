import 'package:flutter/material.dart';
import 'card_widget.dart';

class MoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerGeneral = (String txt) => Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.44),
          child: Text(
            "$txt",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerGeneral("More"),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CardWidget(
                        100.0,
                        Icon(
                          Icons.watch_later,
                          size: 36,
                        ),
                        "Watches and Scales"),
                    CardWidget(
                        100.0,
                        Icon(
                          Icons.comment,
                          size: 36,
                        ),
                        "Community"),
                    CardWidget(
                        100.0,
                        Icon(
                          Icons.watch_later,
                          size: 36,
                        ),
                        "Watches and Scales"),
                    CardWidget(
                        100.0,
                        Icon(
                          Icons.sports_motorsports_rounded,
                          size: 36,
                        ),
                        "Achievement"),
                    CardWidget(
                        100.0,
                        Icon(
                          Icons.fact_check_outlined,
                          size: 36,
                        ),
                        "Weight Loss"),
                    CardWidget(
                        100,
                        Icon(
                          Icons.watch_later,
                          size: 36,
                        ),
                        "Watches and Scales"),
                  ],
                ),
                Column(
                  children: [
                    CardWidget(
                        85.0,
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 36,
                        ),
                        "Calender"),
                    CardWidget(
                        85.0,
                        Icon(
                          Icons.mobile_friendly,
                          size: 36,
                        ),
                        "Integrations"),
                    CardWidget(
                        85.0,
                        Icon(
                          Icons.mobile_friendly,
                          size: 36,
                        ),
                        "Integrations"),
                    CardWidget(
                        85.0,
                        Icon(
                          Icons.data_saver_off_outlined,
                          size: 36,
                        ),
                        "My Data"),
                    CardWidget(
                        85.0,
                        Icon(
                          Icons.mobile_friendly,
                          size: 36,
                        ),
                        "Integrations"),
                    CardWidget(
                        85.0,
                        Icon(
                          Icons.auto_awesome_rounded,
                          size: 36,
                        ),
                        "Weekly Goals"),
                    CardWidget(
                        81.0,
                        Icon(
                          Icons.mobile_friendly,
                          size: 36,
                        ),
                        "Integrations"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
