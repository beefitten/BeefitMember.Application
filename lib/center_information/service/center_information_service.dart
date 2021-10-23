import 'dart:convert' as cnv;

import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:http/http.dart' as http;

class CenterInformationService {
  getCenterInformation(String centerName) async {
    var endpointUrl = Uri.parse(
        "https://beefitmembercenterinformation.azurewebsites.net/getCenterInformation/$centerName");

    var response = await http.get(endpointUrl);

    dynamic body = cnv.jsonDecode(response.body);

    return CenterInformationModel.fromJson(body);
  }
}
