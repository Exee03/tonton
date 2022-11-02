import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/modules/home/controllers/home_controller.dart';

import 'empty_widget.dart';
import 'list_widget.dart';
import 'responsive_widget.dart';
import 'sample_responsive_widget.dart';

class BodyWidget extends GetView<HomeController> {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.movieList.isEmpty
          ? const EmptyWidget()
          // : const ListWidget(),
          : ResponsiveWidget(),
    );
  }
}
