import 'package:get/get.dart';
import 'package:tonton/app/routes/app_pages.dart';
import 'package:tonton/app/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  final _authService = Get.find<AuthService>();

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    print(_authService.isAuthenticate);
    if (!_authService.isAuthenticate) {
      const newRoute = Routes.REGISTER;
      return GetNavConfig.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  final _authService = Get.find<AuthService>();

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (_authService.isAuthenticate) {
      //NEVER navigate to auth screen, when user is already authed
      return null;

      //OR redirect user to another screen
      //return RouteDecoder.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}
