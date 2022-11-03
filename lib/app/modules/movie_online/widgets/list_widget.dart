import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/modules/movie_online/controllers/movie_online_controller.dart';

import 'card_widget.dart';

class ListWidget extends GetView<MovieOnlineController> {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.hasData
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 12,
              ),
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                final movie = controller.movies[index];

                return CardWidget(
                  movie: movie,
                  onTap: () async {},
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
