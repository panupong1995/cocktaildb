part of 'cocktail_bloc.dart';

@immutable
sealed class CocktailEvent {}

class SearchEvent extends CocktailEvent {
  final String searchText;

  SearchEvent({required this.searchText});
}
