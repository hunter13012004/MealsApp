class recipe {
  final String name;
  final String thumbnail;
  final double rating;
  final String totaltime;

  recipe({
    required this.name,
    required this.thumbnail,
    required this.rating,
    required this.totaltime,
  });

  factory recipe.fromJson(dynamic json) {
    return recipe(
        name: json('name') as String ,
        thumbnail: json('images')[0]['hostedLargeUrl'] as String,
        rating: json('rating') as double,
        totaltime: json('totalTime') as String);
  }

  static List<recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) =>recipe.fromJson(data) ).toList() ;
  }

  @override
  String toString() {
    return 'recipe{Name: $name, image: $thumbnail,rating: $rating,totaltime:$totaltime}';
  }
}
// snapshot.map(
//       (data) {
//       return recipe.fromJson(data);
//     }).toList()
