class Recipe {
  final String name;
  final String thumbnail;
  final double rating;
  final String totaltime;

  Recipe({
    required this.name,
    required this.thumbnail,
    required this.rating,
    required this.totaltime,
  });
factory Recipe.fromJson(dynamic json) {
  if (json == null) return Recipe.empty();

  final Map<String, dynamic> jsonMap = json as Map<String, dynamic>;

  return Recipe(
    name: jsonMap['name'] as String? ?? '',
    thumbnail: jsonMap['images'] != null && jsonMap['images'].isNotEmpty
        ? jsonMap['images'][0]['hostedLargeUrl'] as String? ?? ''
        : '',
    rating: jsonMap['rating'] as double? ?? 0.0,
    totaltime: jsonMap['totalTime'] as String? ?? '',
  );
}
static Recipe empty() {
  return Recipe(name: '', thumbnail: '', rating: 0.0, totaltime: '');
}

  static List<Recipe> recipesFromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((data) => Recipe.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'Recipe{Name: $name, image: $thumbnail, rating: $rating, totaltime: $totaltime}';
  }
}