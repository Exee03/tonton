import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
            Hero(
              tag: controller.imageUrl,
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.network(controller.imageUrl),
              ),
            ),
            AnimationWidget(),
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

class AnimationWidget extends HookWidget {
  const AnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = useAnimationController(
      duration: const Duration(seconds: 10),
    )..repeat();

    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * pi,
          child: child,
        );
      },
    );
  }
}
