import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        cardTheme: const CardTheme(
          color: Color.fromRGBO(124, 77, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
    ),
  );
}
