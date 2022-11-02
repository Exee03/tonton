import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

        return CardWidget(movie: movie);
      },
      // separatorBuilder: (BuildContext context, int index) {
      //   return Divider(
      //     color: Colors.red,
      //   );
      // },
    );
  }
}
