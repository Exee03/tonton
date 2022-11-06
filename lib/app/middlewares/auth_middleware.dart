import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/routes/app_pages.dart';
import 'package:tonton/app/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  final _authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    if (_authService.isAuthenticate) return null;

    return const RouteSettings(name: Routes.REGISTER);
  }
}
