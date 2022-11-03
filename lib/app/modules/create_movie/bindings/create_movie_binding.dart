import 'package:get/get.dart';

import '../controllers/create_movie_controller.dart';

class CreateMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateMovieController>(
      () => CreateMovieController(),
    );
  }
}
