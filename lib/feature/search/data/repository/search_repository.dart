import 'package:movie_app/core/network/api/api_service.dart';
import 'package:movie_app/feature/search/data/models/movie_model.dart';

class SearchRepository {
  final ApiService api;

  SearchRepository({required this.api});

  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final result = await api.get(
        "search/movie",
        params: {"query": query, "language": "en-US", "page": "1"},
      );

      final List moviesJson = result["results"] ?? [];
      return moviesJson
          .map((e) => MovieModel.fromJson(e))
          .where((movie) => (movie.rating) > 0)
          .toList();
    } catch (e) {
      print('Search error: $e');
      return [];
    }
  }
}
