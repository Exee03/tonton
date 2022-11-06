import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/modules/movie_online/controllers/movie_online_controller.dart';

import '../../../routes/app_pages.dart';
import 'card_widget.dart';

class ListWidget extends GetView<MovieOnlineController> {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.hasData
          // ? ListView.builder(
          //     padding: const EdgeInsets.symmetric(
          //       vertical: 16,
          //       horizontal: 12,
          //     ),
          //     itemCount: controller.movies.length,
          //     itemBuilder: (context, index) {
          //       final movie = controller.movies[index];

          //       return CardWidget(
          //         movie: movie,
          //         onTap: () => Get.toNamed(
          //           Routes.MOVIE_DETAIL,
          //           arguments: movie,
          //         ),
          //       );
          //     },
          //   )
          ? LiveList(
              // options: LiveOptions(
              //   // Start animation after (default zero)
              //   // delay: Duration(seconds: 1),

              //   // Show each item through (default 250)
              //   // showItemInterval: Duration(milliseconds: 500),

              //   // Animation duration (default 250)
              //   showItemDuration: Duration(seconds: 1),

              //   // Animations starts at 0.05 visible
              //   // item fraction in sight (default 0.025)
              //   // visibleFraction: 0.05,

              //   // Repeat the animation of the appearance
              //   // when scrolling in the opposite direction (default false)
              //   // To get the effect as in a showcase for ListView, set true
              //   reAnimateOnVisibility: false,
              // ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 12,
              ),
              itemCount: controller.movies.length,
              itemBuilder: (context, index, animation) {
                final movie = controller.movies[index];

                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: CardWidget(
                      movie: movie,
                      onTap: () => Get.toNamed(
                        Routes.MOVIE_DETAIL,
                        arguments: movie,
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
