import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movie_online_controller.dart';
import '../widgets/list_widget.dart';

class MovieOnlineView extends GetView<MovieOnlineController> {
  const MovieOnlineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieOnlineView'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.getMovie,
        child: const ListWidget(),
      ),
    );
  }
}
