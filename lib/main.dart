import 'package:cocktail/bloc/cocktail_bloc.dart';
import 'package:cocktail/bloc/cocktail_repository.dart';
import 'package:cocktail/bloc/the_cocktail_db_provider.dart';
import 'package:cocktail/cocktail_db/cocktail_db.dart';
import 'package:cocktail/page/detail_page.dart';
import 'package:cocktail/page/list_page.dart';
import 'package:cocktail/page/search_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(BlocProvider(
    create: (context) => CocktailBloc(CocktailRepository(TheCocktailDbProvider())),
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SearchPage(),
        '/list': (context) => const ListPage(),
        '/detail': (context) => const DetailPage(),
      },
    ),
  ));
}
