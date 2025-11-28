import 'package:movie_app/core/constants/api_key.dart';

class ApiService {
  static const popular = '${baseUrl}movie/popular$apiKey';
  static const recommended = '${baseUrl}movie/top_rated$apiKey';
  static const releases = '${baseUrl}movie/upcoming$apiKey'; 
}