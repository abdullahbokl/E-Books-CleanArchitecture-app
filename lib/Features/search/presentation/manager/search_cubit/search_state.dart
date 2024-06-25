part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final bool hasReachedMax;

  SearchSuccess(this.hasReachedMax);
}

class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}
