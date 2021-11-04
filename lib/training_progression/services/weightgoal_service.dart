import 'dart:convert';
import 'dart:io';
import 'package:beefitmember_application/training_progression/models/weight_goal_model.dart';
import 'package:http/http.dart' as http;

class WeightGoalService {
  create(String user, int currentWeight, int targetWeight) async {
    var endpointUrl = Uri.parse(
        'https://beefitmembertrainingprogression.azurewebsites.net/create');

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

    if (response.statusCode == 200) {
      return "success";
    } else {
      return "error";
    }
  }

  get(String user) async {
    var endpointUrl = Uri.parse(
        'https://beefitmembertrainingprogression.azurewebsites.net/get?user=$user');

    var response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      return WeightGoalModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 204) {
      return "empty";
    } else {
      return "error";
    }
  }
}
