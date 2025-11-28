import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants/api_key.dart';
import 'package:movie_app/core/network/result_api.dart';
import 'package:movie_app/feature/details/data/model/recommended_model.dart';

abstract class RecommendedApi {
  static Future<ResultApi<RecommendedModel>> getRecommended(int movieId) async {
    try {
      Uri url = Uri.https(
        baseUrl,              
        '/3/movie/$movieId/similar',
        {
          'api_key': apiKey,    
        },
      );

      var response = await http.get(url);

      var json = jsonDecode(response.body);

      return SuccessApi(RecommendedModel.fromJson(json));

    } catch (e) {
      return ErrorApi(e.toString());
    }
  }
}
