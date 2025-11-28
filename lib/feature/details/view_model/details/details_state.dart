import 'package:movie_app/feature/details/data/model/details_model.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final DetailsModel details;
  DetailsSuccess(this.details, );
}

class DetailsError extends DetailsState {
  final String errorMessage;
  DetailsError(this.errorMessage);
}