import 'package:movie_app/feature/details/data/model/recommended_model.dart';

abstract class RecommendedState {}

class RecommendedInitial extends RecommendedState {}

class RecommendedLoading extends RecommendedState {}

class RecommendedSuccess extends RecommendedState {
  final RecommendedModel recommended;
  RecommendedSuccess(this.recommended);
}

class RecommendedError extends RecommendedState {
  final String errorMessage;
  RecommendedError(this.errorMessage);
}