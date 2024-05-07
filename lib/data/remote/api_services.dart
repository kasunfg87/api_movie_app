import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/data/remote/secret.dart';

class MovieApiServices {
  // Function to fetch movies based on endpoint.
  Future<List<MovieModel>> getMovies(String endPoint) async {
    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['results'];
      List<MovieModel> movieModel =
          body.map((dynamic item) => MovieModel.fromJson(item)).toList();

      return movieModel;
    } else {
      throw ('Cannot get movies');
    }
  }

  // Function to fetch similar movies based on movie ID.
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
      throw ('Cannot get similar movies');
    }
  }

  // Function to search for movies based on a query.
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
      throw ('Cannot get search results');
    }
  }

  // Function to fetch movie genres based on endpoint.
  Future<List<GenreModel>> getGenre(String endPoint) async {
    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['genres'];
      List<GenreModel> genreModel =
          body.map((dynamic item) => GenreModel.fromJson(item)).toList();

      return genreModel;
    } else {
      throw ('Cannot get genres');
    }
  }

  // Function to fetch cast and crew of a movie based on movie ID.
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
      throw ('Cannot get cast information');
    }
  }

  // Function to fetch movie trailers based on movie ID.
  Future<List<TrailerModel>> getMovieTrailer(String movieId) async {
    String endPoint =
        'https://api.themoviedb.org/3/movie/$movieId/videos?$apiKey';

    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['results'];
      List<TrailerModel> trailerModel =
          body.map((dynamic item) => TrailerModel.fromJson(item)).toList();

      return trailerModel;
    } else {
      throw ('Cannot get movie trailers');
    }
  }

  // Function to fetch biography of a person based on person ID.
  Future<List<BiographyModel>> getBiography(String personId) async {
    String endPoint = 'https://api.themoviedb.org/3/person/$personId?$apiKey';

    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      BiographyModel biographyModel = BiographyModel.fromJson(json);
      return [
        biographyModel
      ]; // Returning a list containing the single BiographyModel instance
    } else {
      throw Exception('Failed to get cast biography');
    }
  }

  // Function to fetch movies a person is known for, based on person ID.
  Future<List<MovieModel>> getKnownForMovies(String personId) async {
    String endPoint =
        'https://api.themoviedb.org/3/discover/movie?$apiKeyWithOutHash&sort_by=popularity.desc&with_people=$personId';

    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['results'];
      List<MovieModel> movieModel =
          body.map((dynamic item) => MovieModel.fromJson(item)).toList();

      return movieModel;
    } else {
      throw ('Cannot get movies known for');
    }
  }

  // Function to fetch reviews of a movie based on movie ID.
  Future<List<ReviewModel>> getMovieReview(String movieId) async {
    String endPoint =
        'https://api.themoviedb.org/3/movie/$movieId/reviews?$apiKey';

    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['results'];
      List<ReviewModel> reviewModel =
          body.map((dynamic item) => ReviewModel.fromJson(item)).toList();

      return reviewModel;
    } else {
      throw ('Cannot get movie reviews');
    }
  }
}
