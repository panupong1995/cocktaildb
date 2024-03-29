part of 'cocktail_bloc.dart';

@immutable
sealed class CocktailState {}

final class CocktailInitial extends CocktailState {}

class CocktailLoading extends CocktailState {}

class CocktailError extends CocktailState {
  final String message;

  CocktailError(this.message);
}

class CocktailFinishState extends CocktailState {
  final List<Drink> drinks;

  CocktailFinishState(this.drinks);
}
