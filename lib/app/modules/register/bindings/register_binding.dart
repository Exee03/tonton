import 'package:get/get.dart';
import 'package:tonton/app/data/providers/user_provider.dart';
import 'package:tonton/app/services/auth_service.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
    Get.lazyPut<AuthService>(
      () => AuthService(),
    );
  }
}
