import 'package:beefitmember_application/center_information/widgets/center_information_basic.dart';
import 'package:beefitmember_application/center_information/widgets/center_information_map.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

class CenterInformationMain extends StatelessWidget {
  final map;
  final model;

  CenterInformationMain(this.map, this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: double.parse(FitnessPackage.model.elevation),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              double.parse(FitnessPackage.model.borderRadius))),
      child: Column(
        children: [
          CenterInformationMap(map, model),
          CenterInformationBasic(model)
        ],
      ),
    );
  }
}
