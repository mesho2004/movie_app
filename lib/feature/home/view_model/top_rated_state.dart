import 'package:movie_app/feature/models/movie_model.dart';

abstract class TopRatedState{} 

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedSuccess extends TopRatedState {
  final List<Movie> movies;

  TopRatedSuccess(this.movies);
}

class TopRatedError extends TopRatedState {
  final String message;
  TopRatedError(this.message);
}
