// recipes_data.dart

class restrodatamodel {
  final String name;
  final String subtitle;
  final String image;
  final String time;
  final double rating;
  final String? address;

  restrodatamodel({
    required this.name,
    required this.subtitle,
    required this.image,
    required this.time,
    required this.rating,
    required this.address,
  });
}

// List<restro> restros = [
//   restro(
//     name: "Spaghetti Carbonara",
//     subtitle: "Classic Italian pasta dish",
//     image: "assets/images/springroll.jpg",
//     time: "30 minutes",
//     rating: 4.5,
//     address: 'DWARKA SEC-7'1
//   ),
//   restro(
//     name: "Chicken Alfredo",
//     subtitle: "Creamy chicken pasta",
//     image: "assets/images/springroll.jpg",
//     time: "40 minutes",
//     rating: 4.8,
//      address: 'DWARKA SEC-7'
//   ),
//   restro(
//     name: "Chicken Alfredo",
//     subtitle: "Creamy chicken pasta",
//     image: "assets/images/springroll.jpg",
//     time: "40 minutes",
//     rating: 4.8,
//      address: 'DWARKA SEC-7'
//   ),
//   restro(
//     name: "Chicken Alfredo",
//     subtitle: "Creamy chicken pasta",
//     image: "assets/images/springroll.jpg",
//     time: "40 minutes",
//     rating: 4.8,
//      address: 'DWARKA SEC-7'
//   ),

//   // Add more recipes as needed
// ];

List<String> recipename = [
  "Spaghetti Carbonara",
  "Chicken Alfredo",
];
List<String> recipeimage = [
  "assets/images/springroll.jpg",
  "assets/images/vegnoodle.jpg"
];
List<String> recipetime = ["40 minutes", "60 Minutes"];
List<String> recipesubtitle = [
  "Creamy chicken pasta",
  "Classic Italian pasta dish"
];
List<String> address = ["dwarka", "sec -7"];
List<double> reciperating = [4.8, 4.0];

final List<restrodatamodel> recipedata = List.generate(
  recipename.length,
  (index) => restrodatamodel(
    name: recipename[index],
    subtitle: recipesubtitle[index],
    image: recipeimage[index],
    time: recipetime[index],
    rating: reciperating[index],
    address: address[index],
  ),
);
