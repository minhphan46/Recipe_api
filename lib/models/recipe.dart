class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory Recipe.fromJon(dynamic json) {
    return Recipe(
      name: json['name']??'',
      images: json['images'] != null ? (json['images'][0]['hostedLargeUrl'] ?? '') : '',
      rating: json['rating'] ?? 0.0,
      totalTime: json['totalTime'] ?? '',
    );
  }
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map(
      (data) {
        return Recipe.fromJon(data);
      },
    ).toList();
  }
}
