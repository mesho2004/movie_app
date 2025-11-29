import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/result_api.dart';
import 'package:movie_app/feature/details/data/model/recommended_model.dart';
import 'package:movie_app/feature/details/data/recommended_api.dart';
import 'package:movie_app/feature/details/view_model/recommended/recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit() : super(RecommendedInitial());

  Future<void> getRecommended(int movieId) async {
    emit(RecommendedLoading());
    try {
      final result = await RecommendedApi.getRecommended(movieId);
      if (result is SuccessApi<RecommendedModel>) {
        emit(RecommendedSuccess(result.data));
      } else if (result is ErrorApi <RecommendedModel>) {
        emit(RecommendedError( result.message));
      } else {
        emit(RecommendedError("Unknown error occurred"));
      }
    } catch (e) {
      emit(RecommendedError(e.toString()));
    }
  }
}
