  import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants/api_key.dart';
import 'package:movie_app/feature/models/movie_model.dart';

class SearchApi {


Future<List<Movie>> getSearch(String searchText) async {
  final url = Uri.parse('${baseUrl}search/movie$apiKey&query=$searchText');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to search movies: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error searching for movies: $e');
  }
}

}