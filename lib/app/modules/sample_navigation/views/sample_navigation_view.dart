import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sample_navigation_controller.dart';

class SampleNavigationView extends GetView<SampleNavigationController> {
  const SampleNavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SampleNavigationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SampleNavigationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
