import 'package:equatable/equatable.dart';
import 'package:movie_app/feature/search/data/models/movie_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieModel> movies;
  const SearchLoaded(this.movies);
  @override
  List<Object> get props => [movies];
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
  @override
  List<Object> get props => [message];
}

class SearchEmpty extends SearchState {}
