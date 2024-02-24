import 'package:movie_app/data/remote/secret.dart';

const nowPlayingMovieEndPoint =
    'https://api.themoviedb.org/3/movie/now_playing?$apiKey';
const popularMovieEndPoint =
    'https://api.themoviedb.org/3/movie/popular?$apiKey';
const upcomingMovieEndPoint =
    'https://api.themoviedb.org/3/movie/upcoming?$apiKey';
const popularTvEndPoint = 'https://api.themoviedb.org/3/tv/popular?$apiKey';

const baseUrl = 'https://api.themoviedb.org/3/search/movie?';
