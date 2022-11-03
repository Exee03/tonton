import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/modules/movie_detail/views/movie_detail_view.dart';
import 'package:tonton/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import 'card_widget.dart';

class ListWidget extends GetView<HomeController> {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      itemCount: controller.movieList.length,
      itemBuilder: (context, index) {
        final movie = controller.movieList[index];

        return CardWidget(
          movie: movie,
          onTap: () async {
            // final res = await Get.to(
            //   const MovieDetailView(),
            //   arguments: "Hello",
            // );
            // print(res);
            // Get.off(const MovieDetailView());
            // Get.to(const MovieDetailView());
            // Get.toNamed('/movie-detail');
            // final parameters = {
            //   "id": "1",
            //   "name": "movie 1",
            // };
            // Get.toNamed(Routes.MOVIE_DETAIL, parameters: parameters);
            // Get.toNamed('/movie-detail/1');
            Get.toNamed('/test-route');
          },
        );
      },
      // separatorBuilder: (BuildContext context, int index) {
      //   return Divider(
      //     color: Colors.red,
      //   );
      // },
    );
  }
}
