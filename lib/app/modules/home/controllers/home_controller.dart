import 'package:get/get.dart';

class Movie {
  String? title;
  String? description;
  int? rating;
  String? imageUrl;

  Movie({
    this.title,
    this.description,
    this.rating,
    this.imageUrl,
  });
}

class HomeController extends GetxController {
  List<Movie> movies = [
    Movie(
      title: 'Movie 1',
      description: 'description 1 asdasdasd sadasda sadas asd asdasd',
      rating: 3,
      imageUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
    ),
    Movie(
      title: 'Movie 2',
      description: 'description 2',
      rating: 3,
      imageUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
    ),
  ];

  final count = 0.obs;
  final keyword = ''.obs;
  // final keyword = Rx<String>('');
  // final keyword = RxString('');

  // bool = true / false
  // int = 1
  // double = 1.0
  // List = []
  // String = "asdasd"
  // num = 1 / 10.1

  List<Movie> get movieList {
    if (keyword.isEmpty) return movies;

    return movies
        .where((element) => element.title?.contains(keyword.value) ?? false)
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void onSearch(String value) {
    keyword.value = value;
  }
}
