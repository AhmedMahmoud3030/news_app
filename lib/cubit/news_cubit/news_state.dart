part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsBottomNavState extends NewsState {}

///////////////////////////
class NewsGetBusniessLoadingState extends NewsState {}

class NewsGetBusniessSuccessState extends NewsState {}

class NewsGetBusniessErrorState extends NewsState {
  final String error;

  NewsGetBusniessErrorState(this.error);
}

/////////////////
class NewsGetSportsLoadingState extends NewsState {}

class NewsGetSportsSuccessState extends NewsState {}

class NewsGetSportsErrorState extends NewsState {
  final String error;

  NewsGetSportsErrorState(this.error);
}

/////////////////
class NewsGetSecinceLoadingState extends NewsState {}

class NewsGetSecinceSuccessState extends NewsState {}

class NewsGetSecinceErrorState extends NewsState {
  final String error;

  NewsGetSecinceErrorState(this.error);
}
