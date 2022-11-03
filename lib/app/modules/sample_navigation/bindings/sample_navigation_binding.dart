import 'package:get/get.dart';

import '../controllers/sample_navigation_controller.dart';

class SampleNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampleNavigationController>(
      () => SampleNavigationController(),
    );
  }
}
