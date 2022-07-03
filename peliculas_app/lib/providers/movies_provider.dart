
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/models/search_movies_response.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey    = 'ea06e1743495c7e49afd5f81f4ac69bf';
  final String _baseUrl   = 'api.themoviedb.org';
  final String _language  = 'es-ES';
  
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> moviesCast = {};
  int _popularPage = 0;

  MoviesProvider(){

    print('MoviesProvider Inicializado');

    getOnDisplayMovies();

    getPopularMovies();

  }

  Future<String> _getJsonData( String endpoint, [int page = 1] ) async { // SI EN LOS PARAMETROS SE LE PONE UN [] ES PORQUE ES OPCIONAL //

    final url = Uri.https( _baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);

    return response.body;

  }

  getOnDisplayMovies() async {

    final jsonData = await this._getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    
    notifyListeners(); // POR SI SUCEDE UN CAMBIO EN LA DATA, LO REDIBUJA //

    // print(nowPlayingResponse.results[0].title);
    
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    // LE PONGO EL OPERADOR SPREAD PORQUE EL PARAMETRO PAGE VA A CAMBIAR, OSEA VOY A NAVEGAR A LA PAGINA 2, 3 Y ASI SUCESIVAMENTE, POR ESO DEBO MANTENER LAS PELICULAS QUE TENGO ACTUALMENTE //
    popularMovies = [ ...popularMovies, ...popularResponse.results];

    // POR SI SUCEDE UN CAMBIO EN LA DATA, LO REDIBUJA //
    notifyListeners();

  }

  Future<List<Cast>> getMovieCast(int movieId) async {

    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;

  }

  Future<List<Movie>> searchMovie(String query) async {

    final url = Uri.https( _baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final response = await http.get(url);

    final searchResponse = SearchResponse.fromJson(response.body);

    return searchResponse.results;

  }

}