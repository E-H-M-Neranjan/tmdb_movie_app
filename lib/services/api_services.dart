import 'dart:convert';

import 'package:http/http.dart';
import 'package:tmdb_movie_app/models/movies_model.dart';

class ApiService {
  final apiKey = "YOUR_API_KEY";
  final popular = "https://api.themoviedb.org/3/movie/popular?";

  //>>>>>>>>>> get popular movies <<<<<<<<<<<<<

  Future<List<Movie>> getMovies({required int page}) async {
    //Send Request
    Response response = await get(Uri.parse("$popular$apiKey&page=$page"));
    //check respon status code
    if (response.statusCode == 200) {
      //extract response body
      Map<String, dynamic> body = jsonDecode(response.body);
      //extract results from body
      List<dynamic> data = body['results'];
      //map to Movie model
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
