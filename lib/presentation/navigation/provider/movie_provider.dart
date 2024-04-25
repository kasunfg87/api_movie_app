import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/core/entities/objects.dart';
import 'package:movie_app/data/remote/api_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieProvider extends ChangeNotifier {
  // -- a list to store the movie list

  List<MovieModel> _movies = [];

  // ----- getter for movie list

  List<MovieModel> get movies => _movies;

  // ----- a list to store the similar movie list

  List<MovieModel> _similarMovies = [];

  // ----- getter for similar movie list

  List<MovieModel> get similarMovies => _similarMovies;

  // ----- a list to store the cast biography list

  List<BiographyModel> _castBiography = [];

  // ----- getter for cast biography list

  List<BiographyModel> get castBiography => _castBiography;

  // ----- a list to store the similar movie list

  List<MovieModel> _knownFor = [];

  // ----- getter for similar movie list

  List<MovieModel> get knownFor => _knownFor;

  // ----- a list to store the reviews  list

  List<ReviewModel> _reviews = [];

  // ----- getter for reviews list

  List<ReviewModel> get reviews => _reviews;

  // ----- loading state

  bool _isLoading = false;

  // ----- get loading state

  bool get isLoading => _isLoading;

  // -----chage loading state

  void setLoading(bool val) {
    _isLoading = val;
  }

  // ----- a list to store the genres list

  List<GenreModel> _genres = [];

  // ----- getter for genres list

  List<GenreModel> get genres => _genres;

  // ----- a list to store the cast and crew list

  List<CastModel> _cast = [];

  // ----- getter for cast and crew list

  List<CastModel> get cast => _cast;

  // ----- a list to store the movie trailer list

  List<TrailerModel> _trailer = [];

  // ----- getter for movie trailer list

  List<TrailerModel> get trailer => _trailer;

  // ----- fetch movie function

  Future<void> getMovies(String endPoint) async {
    try {
      // start the loader
      setLoading(true);

      _movies = await MovieApiServices().getMovies(endPoint);
      Logger().i(_movies[3].id);

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

  Future<void> initiateMovie(MovieModel movieModel) async {
    try {
      // start the loader
      setLoading(true);

      //-- set movie for movie model

      setMovie(movieModel);

      //-- get similar movies using movie id
      _similarMovies = [];

      List<MovieModel> similarTemp = [];

      similarTemp =
          await MovieApiServices().getSimilarMovies(movieModel.id.toString());

      // ----- filtering the known for movie list
      // ----- removing if movie poster not available
      for (var i = 0; i < similarTemp.length; i++) {
        if (similarTemp[i].posterPath != null) {
          _similarMovies.add(similarTemp[i]);
        }
      }

      //-- get cast and crew using movie id

      List<CastModel> castTemp = [];

      _cast = [];

      castTemp =
          await MovieApiServices().getMovieCast(movieModel.id.toString());

      // ----- filtering the cast temp list
      // ----- removing the profile path not available cast
      for (var i = 0; i < castTemp.length; i++) {
        if (castTemp[i].profilePath != null &&
            castTemp[i].knownForDepartment == 'Acting') {
          _cast.add(castTemp[i]);
        }
      }

      //-- get get movie trailer using movie id

      List<TrailerModel> tailerTemp = [];

      _trailer = [];

      tailerTemp =
          await MovieApiServices().getMovieTrailer(movieModel.id.toString());

      // ----- filtering the video list
      // ----- removing the other videos
      for (var i = 0; i < tailerTemp.length; i++) {
        if (tailerTemp[i].type!.contains('Trailer')) {
          _trailer.add(tailerTemp[i]);
        }
      }

      _reviews =
          await MovieApiServices().getMovieReview(movieModel.id.toString());
      Logger().f(_reviews.length);

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

  Future<void> getCastBiography(String personId) async {
    try {
      // start the loader
      setLoading(true);

      _castBiography = [];

      _castBiography = await MovieApiServices().getBiography(personId);

      //-- get known for movies after filltered
      _knownFor = [];

      //-- temp list for filltering

      List<MovieModel> knownForTemp = [];

      knownForTemp = await MovieApiServices().getKnownForMovies(personId);

      // ----- filtering the known for movie list
      // ----- removing if movie poster not available
      for (var i = 0; i < knownForTemp.length; i++) {
        if (knownForTemp[i].posterPath != null) {
          _knownFor.add(knownForTemp[i]);
        }
      }

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

  late YoutubePlayerController _controller;

  YoutubePlayerController get controller => _controller;

  Future<void> initYoutubeController() async {
    _controller = YoutubePlayerController(
        initialVideoId: _trailer[0].key.toString(),
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: false,
          disableDragSeek: true,
        ));
  }
}
