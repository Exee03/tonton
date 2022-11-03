import 'package:get/get.dart';
import 'package:tonton/app/data/providers/movie_provider.dart';

import '../../../data/models/movie_model.dart';

class MovieOnlineController extends GetxController {
  //TODO: Implement MovieOnlineController

  final count = 0.obs;
  final movies = RxList<Movie>();
  final _movieProvider = Get.find<MovieProvider>();

  bool get hasData => movies.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getMovie();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getMovie() async {
    final value = await _movieProvider.getAllMovie();
    if (value == null) return;
    movies.value = value;
  }
}
