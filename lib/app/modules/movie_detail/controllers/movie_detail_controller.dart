import 'package:get/get.dart';
import 'package:tonton/app/data/models/movie_model.dart';

class MovieDetailController extends GetxController {
  //TODO: Implement MovieDetailController

  final count = 0.obs;
  final movie = Rx<Movie>(Movie());

  String get imageUrl => movie.value.image?.medium ?? '';

  @override
  void onInit() {
    super.onInit();
    getMovie();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getMovie() {
    movie.value = Get.arguments;
  }

  void increment() => count.value++;
}
