import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
 feature/serach
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "9d7f94be913eddf2db40e317d2f12f36";

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? params,
  }) async {
    final uri = Uri.parse(
      "$baseUrl/$endpoint",
    ).replace(queryParameters: {"api_key": apiKey, ...?params});

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("API Error: ${response.statusCode}");
    }
  }
}

  static const popular = '${baseUrl}movie/popular$apiKey';
  static const recommended = '${baseUrl}movie/top_rated$apiKey';

  static const releases = '${baseUrl}movie/upcoming$apiKey'; 

  static const releases = '${baseUrl}movie/upcoming$apiKey';

  
