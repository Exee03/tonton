import 'package:get/get.dart';
import 'package:tonton/app/data/providers/movie_provider.dart';

import '../controllers/movie_online_controller.dart';

class MovieOnlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieOnlineController>(
      () => MovieOnlineController(),
    );
    Get.lazyPut<MovieProvider>(
      () => MovieProvider(),
    );
  }
}
