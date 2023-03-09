import '../../domain/entities/movie.dart';

class MovieAdapter {
  MovieAdapter._();
  static Movie fromJson(dynamic data) {
    return Movie(
      id: data["id"],
      title: data["title"],
      originalTitle: data["original_title"],
      subtitle: data["overview"],
      date: data["release_date"],
      language: data["original_language"],
      poster: data["poster_path"],
      popularity: data["popularity"],
      vote: data["vote_average"],
      voteCount: data["vote_count"],
    );
  }
}
