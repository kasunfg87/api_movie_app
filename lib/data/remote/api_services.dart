import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
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

  Future<List<MovieModel>> getSimilarMovies(String movieId) async {
    String endPoint =
        'https://api.themoviedb.org/3/movie/$movieId/recommendations?$apiKey';

    Response response = await get(Uri.parse(endPoint));

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

  Future<List<GenreModel>> getGenre(String endPoint) async {
    Response response = await get(Uri.parse(endPoint));

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

  Future<List<CastModel>> getMovieCast(String movieId) async {
    String endPoint =
        'https://api.themoviedb.org/3/movie/$movieId/credits?$apiKey=THE_KEY&language=en-US';

    Response response = await get(Uri.parse(endPoint));

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
    Logger().d(movieId);
    String endPont =
        'https://api.themoviedb.org/3/movie/$movieId/videos?$apiKey';

    Response response = await get(Uri.parse(endPont));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['results'];

      List<TrailerModel> trailerModel =
          body.map((dynamic item) => TrailerModel.fromJson(item)).toList();

      return trailerModel;
    } else {
      throw ('cant get trailer');
    }
  }

  Future<List<BiographyModel>> getBiography(String personId) async {
    String endPoint = 'https://api.themoviedb.org/3/person/$personId?$apiKey';

    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      // Directly map the JSON response to BiographyModel
      BiographyModel biographyModel = BiographyModel.fromJson(json);

      // Return a list containing the single BiographyModel instance
      return [biographyModel];
    } else {
      throw Exception('Failed to get cast biography');
    }
  }

  Future<List<MovieModel>> getKnownForMovies(String personId) async {
    String endPoint =
        'https://api.themoviedb.org/3/discover/movie?$apiKeyWithOutHash&sort_by=popularity.desc&with_people=$personId';

    Logger().d(endPoint);

    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['results'];

      List<MovieModel> movieModel =
          body.map((dynamic item) => MovieModel.fromJson(item)).toList();

      return movieModel;
    } else {
      throw ('cant get known for movies');
    }
  }
}
