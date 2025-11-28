import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants/api_key.dart';
import 'package:movie_app/core/network/result_api.dart';
import 'package:movie_app/feature/details/data/model/details_model.dart';

abstract class DetailsApi {
  static Future<ResultApi<DetailsModel>> getMovieDetails(int movieId) async {
    final path = '/3/movie/$movieId';
    final queryParameters = {'api_key': apiKey};
    Uri url = Uri.https(baseUrl, path, queryParameters);
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      DetailsModel.fromJson(json);
      return SuccessApi(DetailsModel.fromJson(json));
    } catch (e) {
      return ErrorApi(e.toString());
    }
  }
}
