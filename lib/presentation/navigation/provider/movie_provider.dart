import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/data/remote/api_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// A provider class responsible for managing movie-related data and state.
class MovieProvider extends ChangeNotifier {
  // List to store movies.
  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  // List to store similar movies.
  List<MovieModel> _similarMovies = [];
  List<MovieModel> get similarMovies => _similarMovies;

  // List to store cast biography.
  List<BiographyModel> _castBiography = [];
  List<BiographyModel> get castBiography => _castBiography;

  // List to store known for movies.
  List<MovieModel> _knownFor = [];
  List<MovieModel> get knownFor => _knownFor;

  // List to store movie reviews.
  List<ReviewModel> _reviews = [];
  List<ReviewModel> get reviews => _reviews;

  // List to store movie genres.
  List<GenreModel> _genres = [];
  List<GenreModel> get genres => _genres;

  // List to store movie cast & crew.
  List<CastModel> _cast = [];
  List<CastModel> get cast => _cast;

  // List to store movie trailers.
  List<TrailerModel> _trailer = [];
  List<TrailerModel> get trailer => _trailer;

  // Fetch movies.
  Future<void> getMovies(String endPoint) async {
    try {
      _movies = await MovieApiServices().getMovies(endPoint);
    } catch (e) {
      Logger().e(e);
    } finally {
      notifyListeners();
    }
  }

  // Search movies.
  Future<void> searchMovies(String query, endPoint) async {
    try {
      if (query != '') {
        _movies = [];
        List<MovieModel> searchTemp = [];
        searchTemp = await MovieApiServices().searchMovie(query);

        // Filtering the search for movie list, removing if movie poster not available.
        for (var i = 0; i < searchTemp.length; i++) {
          if (searchTemp[i].posterPath != null) {
            _movies.add(searchTemp[i]);
          }
        }
      } else {
        _movies = await MovieApiServices().getMovies(endPoint);
      }
    } catch (e) {
      Logger().e(e);
    } finally {
      notifyListeners();
    }
  }

  // Fetch movie genres.
  Future<void> getGenreList(String endPoint) async {
    try {
      _genres = await MovieApiServices().getGenre(endPoint);
    } catch (e) {
      Logger().e(e);
    } finally {
      notifyListeners();
    }
  }

  // Initialize movie data.
  Future<void> initializeMovie(MovieModel movieModel) async {
    try {
      setMovie(movieModel);

      // Get similar movies.
      _similarMovies = [];
      List<MovieModel> similarTemp = [];
      similarTemp =
          await MovieApiServices().getSimilarMovies(movieModel.id.toString());

      // Filtering similar movies list.
      for (var i = 0; i < similarTemp.length; i++) {
        if (similarTemp[i].posterPath != null) {
          _similarMovies.add(similarTemp[i]);
        }
      }

      // Get cast and crew.
      _cast = [];
      List<CastModel> castTemp = [];
      castTemp =
          await MovieApiServices().getMovieCast(movieModel.id.toString());

      // Filtering cast list.
      for (var i = 0; i < castTemp.length; i++) {
        if (castTemp[i].profilePath != null &&
            castTemp[i].knownForDepartment == 'Acting') {
          _cast.add(castTemp[i]);
        }
      }

      // Get movie trailers.
      _trailer = [];
      List<TrailerModel> trailerTemp = [];
      trailerTemp =
          await MovieApiServices().getMovieTrailer(movieModel.id.toString());

      // Filtering trailer list.
      for (var i = 0; i < trailerTemp.length; i++) {
        if (trailerTemp[i].type!.contains('Trailer')) {
          _trailer.add(trailerTemp[i]);
        }
      }

      // Get movie reviews.
      _reviews = [];
      _reviews =
          await MovieApiServices().getMovieReview(movieModel.id.toString());
    } catch (e) {
      Logger().e(e);
    } finally {
      notifyListeners();
    }
  }

  // Fetch cast & crew biography and known for movies.
  Future<void> getCastBiography(String personId) async {
    try {
      // Fetch cast biography.
      _castBiography = [];
      _castBiography = await MovieApiServices().getBiography(personId);

      // Fetch known for movies.
      _knownFor = [];
      List<MovieModel> knownForTemp = [];
      knownForTemp = await MovieApiServices().getKnownForMovies(personId);

      // Filtering known for movies list.
      for (var i = 0; i < knownForTemp.length; i++) {
        if (knownForTemp[i].posterPath != null) {
          _knownFor.add(knownForTemp[i]);
        }
      }
    } catch (e) {
      Logger().e(e);
    } finally {
      notifyListeners();
    }
  }

  // Movie Model for storing selected movie.
  late MovieModel _movieModel;
  MovieModel get movieModel => _movieModel;
  void setMovie(MovieModel model) {
    _movieModel = model;
    notifyListeners();
  }

  // Youtube player functions.
  late YoutubePlayerController _controller;
  YoutubePlayerController get controller => _controller;

  // Initialize Youtube controller.
  Future<void> initYoutubeController() async {
    _controller = YoutubePlayerController(
      initialVideoId: _trailer[0].key.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,
        disableDragSeek: true,
      ),
    );
  }
}
