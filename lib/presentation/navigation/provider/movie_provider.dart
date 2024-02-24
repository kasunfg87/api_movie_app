import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/data/remote/api_services.dart';

class MovieProvider extends ChangeNotifier {
  // ----- a list to store the movie list

  List<MovieModel> _movies = [];

  // ----- getter for movie list

  List<MovieModel> get movies => _movies;

  // ----- loading state

  bool _isLoading = false;

  // ----- get loading state

  bool get isLoading => _isLoading;

  // -----chage loading state

  void setLoading(bool val) {
    _isLoading = val;
  }

  // ----- fetch movie function

  Future<void> getMovies(String endPoint) async {
    try {
      // start the loader
      setLoading(true);

      _movies = await MovieApiServices().getMovies(endPoint);
      Logger().i(_movies.length);
      Logger().i(_movies[1].title);
      notifyListeners();

      // stop the loader
      setLoading(false);
    } catch (e) {
      Logger().e(e);
      // stop the loader
      setLoading(false);
    }
  }

  Future<void> searchMovies(String query) async {
    try {
      // start the loader
      setLoading(true);

      _movies = await MovieApiServices().searchMovie(query);
      Logger().i(_movies.length);
      Logger().i(_movies[1].title);
      notifyListeners();

      // stop the loader
      setLoading(false);
    } catch (e) {
      Logger().e(e);
      // stop the loader
      setLoading(false);
    }
  }
}
