import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  login(String email, String password) async {
    var res = await http.post(
        Uri.parse("http://stellers.dk/swagger/index.html") ,
        headers: {},
        body: {"email": email, "password": password});
    final data = json.decode(res.body);

    if(data) return data;
    else return "something went wrong";
  }
}