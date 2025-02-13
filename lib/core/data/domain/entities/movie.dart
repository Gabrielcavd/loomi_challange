import 'package:loomi_challange/core/data/domain/entities/movie_poster.dart';

class Movie {
  final int id;
  final String name;
  final String synopsis;
  final bool currentlyPlaying;
  final String streamLink;
  final String genre;
  final DateTime endDate;
  final MoviePoster poster;
  final MoviePoster? largePoster;
  final MoviePoster? smallPoster;
  final MoviePoster? mediumPoster;
  final MoviePoster? thumbnailPoster;

  Movie({
    required this.id,
    required this.name,
    required this.synopsis,
    required this.currentlyPlaying,
    required this.streamLink,
    required this.genre,
    required this.poster,
    required this.endDate,
    this.largePoster,
    this.smallPoster,
    this.mediumPoster,
    this.thumbnailPoster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final movieAtributes = json['attributes'];
    final moviePosters = movieAtributes['poster']['data']['attributes'];
    final subPosters = moviePosters['formats'];
    return Movie(
      id: movieAtributes['id'] ?? 0,
      name: movieAtributes['name'] ?? '',
      synopsis: movieAtributes['synopsis'] ?? '',
      currentlyPlaying: movieAtributes['currently_playing'] ?? '',
      streamLink: movieAtributes['stream_link'] ?? '',
      endDate: DateTime.parse(movieAtributes['end_date'] ?? ''),
      genre: movieAtributes['genre'] ?? '',
      poster: MoviePoster.fromJson(moviePosters),
      largePoster: subPosters['large'] != null
          ? MoviePoster.fromJson(subPosters['large'])
          : null,
      smallPoster: subPosters['small'] != null
          ? MoviePoster.fromJson(subPosters['small'])
          : null,
      mediumPoster: subPosters['medium'] != null
          ? MoviePoster.fromJson(subPosters['medium'])
          : null,
      thumbnailPoster: subPosters['thumbnail'] != null
          ? MoviePoster.fromJson(subPosters['thumbnail'])
          : null,
    );
  }
}
