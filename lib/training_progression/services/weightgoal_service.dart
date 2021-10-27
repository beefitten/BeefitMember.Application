import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class WeightGoalService {
  create(String user, int currentWeight, int targetWeight) async {
    var endpointUrl = Uri.parse(
        'https://beefitmemberuser.azurewebsites.net/memberLogin'); // <<----- URL GOES HERE!!!

    var body = {};
    body["user"] = user;
    body["currentWeight"] = currentWeight;
    body["targetWeight"] = targetWeight;
    var bodyJson = json.encode(body);

    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    var response = await http.post(
      endpointUrl,
      headers: headers,
      body: bodyJson,
    );

    if (response.statusCode != 200) {
      return "error";
    }
  }
}
