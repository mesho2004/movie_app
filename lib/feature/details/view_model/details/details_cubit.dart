import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/result_api.dart';
import 'package:movie_app/feature/details/data/details_api.dart';
import 'package:movie_app/feature/details/data/model/details_model.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  Future<void> getMovieDetails(int movieId) async {
    emit(DetailsLoading());
    final result = await DetailsApi.getMovieDetails(movieId);
    if (result is SuccessApi<DetailsModel>) {
      emit(DetailsSuccess(result.data));
    } else if (result is ErrorApi<DetailsModel>) {
      emit(DetailsError(result.message));
    }
  }
}
