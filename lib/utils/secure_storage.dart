import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static setToken(String token) async {
    try {
      final storage = new FlutterSecureStorage();
      await storage.write(key: "token", value: token);
    }
    catch (error) {
      print("Something went wrong storing the token: " + error.toString());
    }
  }

  static getToken() async {
    try {
      final storage = new FlutterSecureStorage();
      return await storage.read(key: "token");
    }
    catch (error) {
      print("Something went wrong collecting the token: " + error.toString());
    }
  }

  static deleteToken() async {
    try {
      final storage = new FlutterSecureStorage();
      return await storage.delete(key: "token");
    }
    catch (error) {
      print("Something went wrong with deleting the token: " + error.toString());
    }
  }
}