
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey    = 'ea06e1743495c7e49afd5f81f4ac69bf';
  final String _baseUrl   = 'api.themoviedb.org';
  final String _language  = 'es-ES';
  
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider(){

    print('MoviesProvider Inicializado');

    getOnDisplayMovies();

    getPopularMovies();

  }

  getOnDisplayMovies() async {

    var url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    // POR SI SUCEDE UN CAMBIO EN LA DATA, LO REDIBUJA //
    notifyListeners();

    // print(nowPlayingResponse.results[0].title);
    
  }

  getPopularMovies() async {

    var url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    final popularResponse = PopularResponse.fromJson(response.body);

    // LE PONGO EL OPERADOR SPREAD PORQUE EL PARAMETRO PAGE VA A CAMBIAR, OSEA VOY A NAVEGAR A LA PAGINA 2, 3 Y ASI SUCESIVAMENTE, POR ESO DEBO MANTENER LAS PELICULAS QUE TENGO ACTUALMENTE //
    popularMovies = [ ...popularMovies, ...popularResponse.results];

    // POR SI SUCEDE UN CAMBIO EN LA DATA, LO REDIBUJA //
    notifyListeners();

  }

}