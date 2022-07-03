
import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [

      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '', 
      )

    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null), 
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // return Text('buildSuggestions: $query');

    if(query.isEmpty){
      return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 100),
        ),
      );
    }

    return Container();

  }

}