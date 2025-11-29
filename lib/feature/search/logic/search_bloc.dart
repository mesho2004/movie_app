import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/search_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc({required this.repository}) : super(SearchInitial()) {
    on<SearchMovies>(_onSearchMovies);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchMovies(
    SearchMovies event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    // if (event.query.length < 2) {
    //   emit(SearchEmpty());
    //   return;
    // }

    // emit(SearchLoading());

    try {
      final movies = await repository.searchMovies(event.query);

      movies.isEmpty ? emit(SearchEmpty()) : emit(SearchLoaded(movies));
    } catch (e) {
      emit(SearchError('Something went wrong!'));
    }
  }

  Future<void> _onClearSearch(
    ClearSearch event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchInitial());
  }
}
