import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphBox extends StatelessWidget {
  String title;

  int value;

  GraphBox(String this.title, int this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          // color: Color(int.parse(FitnessPackage.model.primaryColor)),
        ),

        // color: Color(int.parse(FitnessPackage.model.backgroundColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  H3Text(title),
                  H2Text("$value Kg"),
                  H3Text("Last messurement"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Graph(Colors.blue.shade400),
            ),
          ],
        ),
      ),
    );
  }
}

class Graph extends StatelessWidget {
  var color;

  Graph(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      color: color,
    );
  }
}
