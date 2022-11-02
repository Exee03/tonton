import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            icon: Icon(Icons.filter_list),
          )
        ],
      ),
      body: Obx(
        () => controller.movieList.isEmpty
            ? Center(
                child: Text(
                  'no data',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                itemCount: controller.movieList.length,
                itemBuilder: (context, index) {
                  final movie = controller.movieList[index];

                  return Card(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.all(
                    //     Radius.circular(15.0),
                    //   ),
                    // ),
                    child: ListTile(
                      title: Text(movie.title ?? ''),
                      subtitle: Text(
                        movie.description ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Image.network(
                        movie.imageUrl ??
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      ),
                      // trailing: Text('${movie.rating}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                          Text((movie.rating ?? 0).toStringAsFixed(1)),
                        ],
                      ),
                      // trailing: Text(movie.rating.toString()),
                    ),
                  );
                },
                // separatorBuilder: (BuildContext context, int index) {
                //   return Divider(
                //     color: Colors.red,
                //   );
                // },
              ),
      ),
    );
  }
}
