import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/data/home_api.dart';
import 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final HomeApi api;

  TopRatedCubit(this.api) : super(TopRatedInitial());

  Future<void> loadTopRated() async {
    emit(TopRatedLoading());
    try {
      final movies = await api.getTopRated();
      emit(TopRatedSuccess(movies));
    } catch (e) {
      emit(TopRatedError("Failed to load top rated movies"));
    }
  }
}
