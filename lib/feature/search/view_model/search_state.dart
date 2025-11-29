import 'package:movie_app/feature/models/movie_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Movie> movies;
  SearchSuccess(this.movies);
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
