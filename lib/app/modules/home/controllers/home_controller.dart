import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tonton/app/modules/home/widgets/filter_widget.dart';

class Movie {
  String? title;
  String? description;
  int? rating;
  String? imageUrl;
  DateTime? releaseAt;

  Movie({
    this.title,
    this.description,
    this.rating,
    this.imageUrl,
    this.releaseAt,
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
      releaseAt: DateTime(2022, 11, 1),
    ),
    Movie(
      title: 'Movie 2',
      description: 'description 2',
      rating: 5,
      imageUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
      releaseAt: DateTime(2022, 11, 2),
    ),
  ];

  final count = 0.obs;
  final keyword = ''.obs;
  // final keyword = Rx<String>('');
  // final keyword = RxString('');

  final date = Rx<DateTime?>(null);
  final rating = Rx<double?>(null);
  // bool = true / false
  // int = 1
  // double = 1.0
  // List = []
  // String = "asdasd"
  // num = 1 / 10.1

  List<Movie> get movieList {
    List<Movie> filterMovie = movies;

    if (rating.value != null) {
      filterMovie = filterMovie
          .where((element) => element.rating == rating.value?.toInt())
          .toList();
    }

    if (date.value != null) {
      filterMovie = filterMovie
          .where((element) => element.releaseAt == date.value)
          .toList();
    }

    if (keyword.isNotEmpty) {
      filterMovie = filterMovie
          .where((element) => element.title?.contains(keyword.value) ?? false)
          .toList();
    }

    return filterMovie;
  }

  String get selectDate =>
      date.value == null ? 'Select Date' : DateFormat.yMd().format(date.value!);

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

  void filter() {
    Get.bottomSheet(
      const FilterWidget(),
    );
  }

  Future<void> filterDate() async {
    final now = DateTime.now();

    date.value = await showDatePicker(
      context: Get.context!,
      initialDate: now,
      firstDate: DateTime(1990),
      // lastDate: now,
      lastDate: DateTime(now.year + 5),
    );
  }

  void onRating(double value) {
    rating.value = value;
  }
}
