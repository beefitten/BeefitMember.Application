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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 3,
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.height * 0.4),
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 14.5),
            markers: Set.from(markers),
          ),
        ),
      ),
    );
  }
}
