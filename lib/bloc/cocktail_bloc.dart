import 'package:bloc/bloc.dart';
import 'package:cocktail/bloc/cocktail_repository.dart';
import 'package:cocktail/cocktail_db/cocktail_db.dart';
import 'package:cocktail/cocktail_db/drink.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'cocktail_event.dart';
part 'cocktail_state.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  final CocktailRepository repository;
  CocktailBloc(this.repository) : super(CocktailInitial()) {
    on<SearchEvent>((event, emit) async {
      emit(CocktailLoading());
      try {
      var drinks = await repository.searchData(event.searchText);
      emit(CocktailFinishState(drinks));
      } catch (e) {
        emit(CocktailError(e.toString()));
        return;
      }
    });
  }
}
