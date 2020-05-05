import 'dart:convert';

import 'package:mymovies/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider{
    String _apiKey = '81f888823f079b9941a4534f90d59f34';
    String _url = 'api.themoviedb.org';
    String _language = 'es-Es';

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
}
