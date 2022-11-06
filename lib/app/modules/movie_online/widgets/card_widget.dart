import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../data/models/movie_model.dart' as model;

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  final model.Movie movie;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(15.0),
      //   ),
      // ),
      child: ListTile(
        onTap: onTap,
        title: Text(movie.name ?? ''),
        subtitle: Text(
          movie.summary ?? '',
          overflow: TextOverflow.ellipsis,
        ),
        // subtitle: Html(
        //   data: movie.summary ?? '',
        // ),
        leading: Hero(
          tag: movie.image?.medium ?? '',
          child: Image.network(
            movie.image?.medium ??
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          ),
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
            Text((movie.rating?.average ?? 0).toStringAsFixed(1)),
          ],
        ),
        // trailing: Text(movie.rating.toString()),
      ),
    );
  }
}
