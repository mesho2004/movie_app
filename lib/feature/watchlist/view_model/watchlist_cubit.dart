import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/models/movie_model.dart';
import 'package:movie_app/feature/watchlist/view_model/watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchListState> {
  WatchlistCubit() : super(WatchListEmpty());

  final List<Movie> _watchList = [];

  void addToWatchList(Movie movie) {
    _watchList.add(movie);
    emit(WatchListLoaded(List.from(_watchList)));
  }

  void removeFromWatchList(Movie movie) {
    _watchList.removeWhere((m) => m.id == movie.id);

    if (_watchList.isEmpty) {
      emit(WatchListEmpty());
    } else {
      emit(WatchListLoaded(List.from(_watchList)));
    }
  }
}
