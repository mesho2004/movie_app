import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/search/data/search_api.dart';
import 'package:movie_app/feature/search/view_model/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  

  SearchCubit() : super(SearchInitial());

  final SearchApi searchApi = SearchApi();

  void search(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final movies = await searchApi.getSearch(query);

      if (movies.isEmpty) {
        emit(SearchEmpty()); 
      } else {
        emit(SearchSuccess(movies)); 
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
