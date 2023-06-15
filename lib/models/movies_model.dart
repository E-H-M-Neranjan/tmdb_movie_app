class Movie {
  String? posterpath;
  String? overview;
  int? id;
  String? titel;
  String? backdropPath;

  Movie(
      {this.backdropPath, this.id, this.overview, this.posterpath, this.titel});

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      backdropPath: map['backdrop_path'],
      id: map['id'],
      overview: map['overview'],
      posterpath: map['poster_path'],
      titel: map['title'],
    );
  }
}
