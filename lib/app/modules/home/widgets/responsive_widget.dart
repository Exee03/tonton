import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/modules/home/controllers/home_controller.dart';
import 'package:tonton/app/modules/home/widgets/list_widget.dart';

import 'grid_widget.dart';

class ResponsiveWidget extends GetResponsiveView<HomeController> {
  ResponsiveWidget({super.key});

  @override
  Widget builder() {
    if (screen.isPhone || screen.isWatch) return const ListWidget();

    return const GridWidget();
  }
}
