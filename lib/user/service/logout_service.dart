import 'package:beefitmember_application/utils/secure_storage.dart';

class LogoutService {
  static logOut() async {
    await SecureStorage.deleteToken();
  }
}
