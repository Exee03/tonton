import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class FilterWidget extends GetView<HomeController> {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40.0),
        topLeft: Radius.circular(40.0),
      ),
      child: Column(
        children: [
          ListTile(
            // onTap: () => controller.filterDate(context),
            // onTap: () {
            //   controller.filterDate(context);
            // },
            onTap: controller.filterDate,
            title: Text('Date'),
            subtitle: Obx(() => Text(
                  // controller.date.value.toString(),
                  controller.selectDate,
                )),
          ),
          ListTile(
            title: Text("Rating"),
            subtitle: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: controller.onRating,
            ),
          )
        ],
      ),
    );
  }
}
