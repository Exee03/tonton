import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../models/movie_model.dart';

class MovieProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Movie.fromJson(map);
      if (map is List) return map.map((item) => Movie.fromJson(item)).toList();
    };
    httpClient.baseUrl = dotenv.env['ENDPOINT'];
  }

  Future<List<Movie>?> getAllMovie() async {
    final response = await get('shows');
    return response.body;
  }

  Future<Movie?> getMovie(int id) async {
    final response = await get('shows/$id');
    return response.body;
  }

  // Future<Response<Movie>> postMovie(Movie movie) async =>
  //     await post('movie', movie);

  // Future<Response> deleteMovie(int id) async => await delete('movie/$id');
}
