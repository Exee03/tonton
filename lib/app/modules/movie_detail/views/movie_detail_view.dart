import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tonton/app/modules/sample_navigation/views/sample_navigation_view.dart';

import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MovieDetailView is working',
              style: TextStyle(fontSize: 20),
            ),
            TextButton.icon(
              onPressed: () {
                Get.back(result: 'Success lah');
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
              label: const Text('Back Previous Page'),
            ),
            TextButton.icon(
              onPressed: () {
                print(Get.arguments);
              },
              icon: const Icon(
                Icons.aspect_ratio,
              ),
              label: const Text('Get data form Arguments'),
            ),
            TextButton.icon(
              onPressed: () {
                // Get.to(const SampleNavigationView());
                // Get.off(const SampleNavigationView());
                Get.offAll(const SampleNavigationView());
              },
              icon: const Icon(
                Icons.arrow_right,
              ),
              label: const Text('To Sample Page'),
            ),
            TextButton.icon(
              onPressed: () {
                print(Get.parameters['id']);
              },
              icon: const Icon(
                Icons.paragliding,
              ),
              label: const Text('Get Parameter'),
            ),
          ],
        ),
      ),
    );
  }
}
