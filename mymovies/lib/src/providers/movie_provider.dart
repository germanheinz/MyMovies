import 'dart:async';
import 'dart:convert';

import 'package:mymovies/src/models/cast.dart';
import 'package:mymovies/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider{
    String _apiKey = '81f888823f079b9941a4534f90d59f34';
    String _url = 'api.themoviedb.org';
    String _language = 'es-Es';
    bool _loading = false;

    int _popularPage = 0;

    List<Movie> _populars = new List();
    //tuberia
    final _popularStreamController = StreamController<List<Movie>>.broadcast();
    //proceso para introducir peliculas
    Function(List<Movie>) get popularsSink => _popularStreamController.sink.add;
    // proceso para escuchar lo que emita
    Stream<List<Movie>> get popularsStream => _popularStreamController.stream;


    void disposeStreams(){
      _popularStreamController?.close();
    }


    Future<List<Movie>> getInTheatres() async{
      final url = Uri.https(_url, '/3/movie/now_playing', {
        'api_key' : _apiKey,
        'language': _language
      });
      final response = await http.get(url);
      final decodedData = json.decode(response.body);

      final movies = new Movies.fromJsonList(decodedData['results']);
      // print(movies.items[0].title);
      return movies.items;
    }
    
    Future<List<Movie>> getPopulars() async{
      if(_loading) return [];
      _loading = true;
      _popularPage++;
      final url = Uri.https(_url, '/3/movie/popular', {
        'api_key' : _apiKey,
        'language': _language,
        'page': _popularPage.toString()
      });
     
      final response = await http.get(url);
      final decodedData = json.decode(response.body);

      final movies = new Movies.fromJsonList(decodedData['results']);
      // print(movies.items[0].title);

      _populars.addAll(movies.items);
      popularsSink(_populars);
      _loading=false;
      return movies.items;
    }

    Future<List<Actor>> getCast(String movieId) async{
      final url = Uri.https(_url, '/3/movie/$movieId/credits', { 
        'api_key' : _apiKey,
        'language': _language
        });
        final resp = await http.get(url);
        final decodedData = json.decode(resp.body);
        final cast = new Cast.fromJsonList(decodedData['cast']);
        return cast.actors;
    }

    Future<List<Movie>> searchMovie(String query) async{
      final url = Uri.https(_url, '/3/search/movie', {
        'api_key' : _apiKey,
        'language': _language,
        'query'   : query
      });
      final response = await http.get(url);
      final decodedData = json.decode(response.body);

      final movies = new Movies.fromJsonList(decodedData['results']);
      // print(movies.items[0].title);
      return movies.items;
    }
}
