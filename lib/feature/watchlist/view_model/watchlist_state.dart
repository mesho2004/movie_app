import 'package:movie_app/feature/models/movie_model.dart';

abstract class WatchListState {}

class WatchListEmpty extends WatchListState {}

class WatchListLoaded extends WatchListState {
  final List<Movie> movies;
  WatchListLoaded(this.movies);
}
