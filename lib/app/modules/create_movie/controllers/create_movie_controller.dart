import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:tonton/app/modules/home/controllers/home_controller.dart';

class CreateMovieController extends GetxController {
  //TODO: Implement CreateMovieController
  late GetStorage box;
  final storageKey = "Movie";
  final formKey = GlobalKey<FormState>();
  final count = 0.obs;
  final movie = Rx<Movie>(Movie());

  var textEditorController = TextEditingController();

  String get selectDate => movie.value.releaseAt == null
      ? ''
      : DateFormat.yMd().format(movie.value.releaseAt!);

  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
  }

  @override
  void onReady() {
    super.onReady();
    // final value = box.read(storageKey);
    // print(box.getKeys());
    // print(box.getValues());
    // print(value);
    // if (value == null) return;

    // movie.value = Movie(
    //   title: "asdasd",
    //   description: "asds",
    //   rating: 5,
    //   imageUrl: "asd",
    //   releaseAt: DateTime.now(),
    // );
    // movie.refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void onTitleChanged(String value) {
    movie.value.title = value;
  }

  void onDescriptionChanged(String value) {
    movie.value.description = value;
  }

  void onRatingChanged(String value) {
    movie.value.rating = int.tryParse(value);
  }

  void onImageUrlChanged(String value) {
    movie.value.imageUrl = value;
  }

  Future<void> onReleaseAtChanged() async {
    // movie.value.releaseAt = DateTime(year);
    final now = DateTime.now();
    movie.value.releaseAt = await showDatePicker(
      context: Get.context!,
      initialDate: movie.value.releaseAt ?? now,
      firstDate: DateTime(1990),
      // lastDate: now,
      lastDate: DateTime(now.year + 5),
    );
    movie.refresh();
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? ratingValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? imageUrlValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!GetUtils.isURL(value)) return 'Invalid URL';
    return null;
  }

  void onSubmit() {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;

    // print(movie.value.toMap());

    // box.write('MOVIE', movie.value.toMap());

    // Future.delayed(const Duration(seconds: 3), () {
    //   final value = box.read('MOVIE');
    //   print(value);
    // });

    // box.write(storageKey, movie.value.toMap());

    box.write(storageKey, movie.value.toMap());
    Future.delayed(const Duration(seconds: 3), () {
      final value = box.read(storageKey);
      print(value);
    });
  }

  deleteStorage() {
    box.remove(storageKey);

    Future.delayed(const Duration(seconds: 3), () {
      final value = box.read(storageKey);
      print(value);
    });
  }
}
