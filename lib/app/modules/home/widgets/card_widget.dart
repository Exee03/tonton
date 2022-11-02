import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
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
  }
}
