import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/data/remote/secret.dart';

class MovieApiServices {
  Future<List<MovieModel>> getMovies(String endPont) async {
    Response response = await get(Uri.parse(endPont));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['results'];

      List<MovieModel> movieModel =
          body.map((dynamic item) => MovieModel.fromJson(item)).toList();

      return movieModel;
    } else {
      throw ('cant get movies');
    }
  }

  Future<List<MovieModel>> searchMovie(String query) async {
    final encodedQuery = Uri.encodeQueryComponent(query);

    final String url =
        'https://api.themoviedb.org/3/search/movie?query=$encodedQuery&$apiKey';

    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['results'];

      List<MovieModel> movieModel =
          body.map((dynamic item) => MovieModel.fromJson(item)).toList();

      return movieModel;
    } else {
      throw ('cant get movies');
    }
  }

  Future<List<GenreModel>> getGenre(String endPont) async {
    Response response = await get(Uri.parse(endPont));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['genres'];

      List<GenreModel> genreModel =
          body.map((dynamic item) => GenreModel.fromJson(item)).toList();

      return genreModel;
    } else {
      throw ('cant get genres');
    }
  }

  Future<List<CastModel>> getMovieCast(String endPont) async {
    Response response = await get(Uri.parse(endPont));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['cast'];

      List<CastModel> castModel =
          body.map((dynamic item) => CastModel.fromJson(item)).toList();

      return castModel;
    } else {
      throw ('cant get cast');
    }
  }

  Future<List<TrailerModel>> getMovieTrailer(String movieId) async {
    String endPont =
        'https://api.themoviedb.org/3/movie/$movieId/videos?$apiKey';

    Response response = await get(Uri.parse(endPont));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['results'];

      List<TrailerModel> castModel =
          body.map((dynamic item) => TrailerModel.fromJson(item)).toList();

      return castModel;
    } else {
      throw ('cant get trailer');
    }
  }
}
