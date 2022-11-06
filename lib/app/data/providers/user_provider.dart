import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';
import '../models/user_model.dart';

class UserProvider extends GetConnect {
  final _authService = Get.find<AuthService>();

  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    // if (map is Map<String, dynamic>) return User.fromJson(map);
    // if (map is List) return map.map((item) => User.fromJson(item)).toList();
    // };
    httpClient.baseUrl = dotenv.env['AUTH_ENDPOINT'];
  }

  Future<User?> getUser() async {
    final headers = _authService.getHeader();
    final response = await get(
      'user',
      headers: headers,
      decoder: (data) => User.fromJson(data['data']),
    );
    return response.body;
  }

  Future<dynamic> home() async {
    try {
      final response = await get('home');
      return response.body;
    } catch (e) {
      print(e);
    }
  }

  // this should be another provider
  Future<String?> loginUser(User user) async {
    final response = await post('login', user);
    return response.body;
  }

  Future<String?> addUser(User user) async {
    try {
      final response = await post('register', user.toJson());
      if (!response.body['success']) throw response.body['error'];
      return response.body['data'];
    } catch (e) {
      print(e);
    }
  }
}
