class MovieModel {
  final int id;
  final String title;
  final String? posterPath;
  final double rating;
  final String? releaseDate;
  double? popularity;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.releaseDate,
  });
  String get imageUrl =>
      posterPath != null ? "https://image.tmdb.org/t/p/w500$posterPath" : "";
  int get year => releaseDate != null && releaseDate!.isNotEmpty
      ? DateTime.parse(releaseDate!).year
      : 0;
  int get duration => 120;
  String get genre => "Action";
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      posterPath: json["poster_path"],
      rating: (json["vote_average"] as num?)?.toDouble() ?? 0.0,
      releaseDate: json["release_date"],
    );
  }

  get originalTitle => null;
}
