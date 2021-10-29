import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CenterInformationPackage {
  static final CenterInformationPackage _instance =
      CenterInformationPackage._internal();

  static late CenterInformationModel model;
  static late GoogleMap map;

  factory CenterInformationPackage() {
    return _instance;
  }

  CenterInformationPackage._internal() {}

  void update(CenterInformationModel responseModel, GoogleMap responseMap) {
    model = responseModel;
    map = responseMap;
  }
}
