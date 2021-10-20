import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CenterInformationMap extends StatefulWidget {
  CenterInformationMap();
  @override
  _CenterInformationMapState createState() => _CenterInformationMapState();
}

class _CenterInformationMapState extends State<CenterInformationMap> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(56.16961731336789, 10.193464582067223);

  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    markers.add(Marker(
        markerId: MarkerId('CurrentGym'), draggable: false, position: _center));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
                maxHeight: MediaQuery.of(context).size.height * 0.4),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 14.5),
              markers: Set.from(markers),
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 0.4),
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
        padding: const EdgeInsets.only(left: 36, bottom: 46),
        child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.5),
            child: CapsText('Jens Baggesens vej')),
      )
    ]);
  }
}
