import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CenterInformationMap extends StatefulWidget {
  final GoogleMap map;
  final CenterInformationModel model;

  CenterInformationMap(this.map, this.model);

  @override
  _CenterInformationMapState createState() =>
      _CenterInformationMapState(map, model);
}

class _CenterInformationMapState extends State<CenterInformationMap> {
  final GoogleMap map;
  final CenterInformationModel model;

  _CenterInformationMapState(this.map, this.model);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomLeft, children: [
      Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height * 0.3),
              child: map),
        ),
        Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 0.3),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: <Color>[
                Colors.white.withOpacity(0.1),
                Colors.black12.withOpacity(0.9)
              ])),
        )
      ]),
      Padding(
        padding: const EdgeInsets.only(left: 32, bottom: 42),
        child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            child: CapsText('${model.location}')),
      )
    ]);
  }
}
