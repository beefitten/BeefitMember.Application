import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  login(String email, String password) async {
    var resBody = {};
    resBody["email"] = email;
    resBody["password"] = password;
    var str = json.encode(resBody);

    var res = await http.post(
        Uri.parse("http://stellers.dk/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, body: str);

    var data = res.body;

    print(data);

    return data;
  }
}

/*
var res = await http.post(
Uri.parse("http://stellers.dk/login") ,
headers: {},
body: {"email": email, "password": password});
final data = json.decode(res.body);

if(data) return data;
else return "something went wrong";
}*/
