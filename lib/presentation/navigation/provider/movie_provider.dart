import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/data/remote/api_services.dart';

class MovieProvider extends ChangeNotifier {
  // ----- a list to store the movie list

  List<MovieModel> _movies = [];

  // ----- getter for movie list

  List<MovieModel> get movies => _movies;

  // ----- a list to store the similar movie list

  List<MovieModel> _similarMovies = [];

  // ----- getter for similar movie list

  List<MovieModel> get similarMovies => _similarMovies;

  // ----- loading state

  bool _isLoading = false;

  // ----- get loading state

  bool get isLoading => _isLoading;

  // -----chage loading state

  void setLoading(bool val) {
    _isLoading = val;
  }

  // ----- a list to store the movie list

  List<GenreModel> _genres = [];

  // ----- getter for movie list

  List<GenreModel> get genres => _genres;

  // ----- a list to store the movie list

  List<CastModel> _cast = [];

  // ----- getter for movie list

  List<CastModel> get cast => _cast;

  // ----- fetch movie function

  Future<void> getMovies(String endPoint) async {
    try {
      // start the loader
      setLoading(true);

      _movies = await MovieApiServices().getMovies(endPoint);
      Logger().i(_movies.length);
      Logger().i(_movies[1].id);

      // stop the loader
      setLoading(false);
    } catch (e) {
      Logger().e(e);
      // stop the loader
      setLoading(false);
    } finally {
      // stop the loader
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> searchMovies(String query) async {
    try {
      // start the loader
      setLoading(true);

      _movies = await MovieApiServices().searchMovie(query);
      Logger().i(_movies[0].id);

      // stop the loader
      setLoading(false);
    } catch (e) {
      Logger().e(e);
      // stop the loader
      setLoading(false);
    } finally {
      // stop the loader
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> getGenreList(String endPoint) async {
    try {
      // start the loader
      setLoading(true);

      _genres = await MovieApiServices().getGenre(endPoint);
      Logger().i(_genres.length);
      Logger().i(_genres[1].id);

      // stop the loader
      setLoading(false);
    } catch (e) {
      Logger().e(e);
      // stop the loader
      setLoading(false);
    } finally {
      // stop the loader
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> getSimilarMovies(String endPoint) async {
    try {
      // start the loader
      setLoading(true);

      _similarMovies = await MovieApiServices().getMovies(endPoint);
      Logger().i(_similarMovies.length);

      // stop the loader
      setLoading(false);
    } catch (e) {
      Logger().e(e);
      // stop the loader
      setLoading(false);
    } finally {
      // stop the loader
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> getCastList(String endPoint) async {
    try {
      // start the loader
      setLoading(true);

      _cast = await MovieApiServices().getMovieCast(endPoint);
      Logger().i(_genres.length);
      Logger().i(_genres[1].id);

      // stop the loader
      setLoading(false);
    } catch (e) {
      Logger().e(e);
      // stop the loader
      setLoading(false);
    } finally {
      // stop the loader
      setLoading(false);
      notifyListeners();
    }
  }

  // ----- to store the selected movie model

  late MovieModel _movieModel;

  // ----- get the selected movie model

  MovieModel get movieModel => _movieModel;

  // ----- set the movie model clicked on the movie card

  void setMovie(MovieModel model) {
    _movieModel = model;

    notifyListeners();
  }
}
