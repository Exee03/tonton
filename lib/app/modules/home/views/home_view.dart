import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tonton/app/modules/home/widgets/body_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Search',
            icon: Icon(Icons.search),
          ),
          onChanged: controller.onSearch,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.filter,
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
      body: const BodyWidget(),
    );
  }
}
