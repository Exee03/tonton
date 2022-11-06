import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final storageKey = 'TOKEN';
  final box = GetStorage();

  bool get isAuthenticate => getToken()?.isNotEmpty ?? false;

  void saveToken(String token) {
    box.write(storageKey, token);
  }

  void deleteToken() {
    box.remove(storageKey);
  }

  String? getToken() {
    return box.read(storageKey);
  }

  Map<String, String> getHeader() {
    final token = getToken();
    final headers = {
      "Authorization": "Bearer $token",
    };
    return headers;
  }
}
