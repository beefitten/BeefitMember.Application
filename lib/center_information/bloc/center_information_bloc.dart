import 'package:beefitmember_application/center_information/bloc/center_information_events.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_state.dart';
import 'package:beefitmember_application/center_information/models/center_information_package.dart';
import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:beefitmember_application/center_information/service/center_information_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CenterInformationBloc
    extends Bloc<CenterInformationEvents, CenterInformationState> {
  CenterInformationService infoService;
  late GoogleMapController mapController;

  CenterInformationBloc(this.infoService) : super(InfoInitialState());

  @override
  Stream<CenterInformationState> mapEventToState(
      CenterInformationEvents event) async* {
    if (event is LoadEvent) {
      yield InfoLoadingState();
      try {
        CenterInformationModel response =
            await infoService.getData(event.fitnessName);
        GoogleMap loadedMap = await setupGoogleMaps(LatLng(
            double.parse(response.latitude), double.parse(response.longitude)));

        // CenterInformationPackage().update(response, loadedMap);

        yield InfoLoadedState(model: response, map: loadedMap);
      } catch (e) {
        yield InfoErrorState(message: "Could not gather center information");
      }
    }
  }

  setupGoogleMaps(LatLng center) async {
    List<Marker> markers = [];
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    markers.add(Marker(
        markerId: MarkerId('CurrentGym'), draggable: false, position: center));

    return GoogleMap(
      zoomControlsEnabled: false,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 15.1),
      markers: Set.from(markers),
    );
  }

  void dispose() {}
}
