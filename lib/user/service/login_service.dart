import 'dart:convert';
import 'dart:io';
import 'package:beefitmember_application/utils/secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginService {
  login(String email, String password) async {
    var endpointUrl =
        Uri.parse('https://beefitmemberuser.azurewebsites.net/memberLogin');

    var body = {};
    body["email"] = email;
    body["password"] = password;
    var bodyJson = json.encode(body);

    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    var response = await http.post(
      endpointUrl,
      headers: headers,
      body: bodyJson,
    );

    if (response.statusCode == 200){
      var responseJson = json.decode(response.body);
      var token = responseJson['token'].toString();

      await SecureStorage.setToken(token);

      return token;
    }
    else
    {
      return "error";
    }
  }
}
