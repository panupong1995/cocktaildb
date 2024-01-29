import 'package:cocktail/bloc/cocktail_bloc.dart';
import 'package:cocktail/page/list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var textCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textCtrl,
                ),
              ),
              IconButton(
                onPressed: () {
                  textCtrl.clear();
                }, 
                icon: Icon(Icons.close)
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CocktailBloc>(context)
                  .add(SearchEvent(searchText: textCtrl.text));
              Navigator.pushNamed(
                context,
                '/list',
              );
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }
}
