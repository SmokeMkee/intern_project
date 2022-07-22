import 'package:intern_project/dto/rating.dart';

class Products {
  final int? id;
  final String? title;
  final double? price;
  final String? category;
  final String? description;
  final String? image;
  final Rating? rating;
  Products({
    this.price,
    this.id,
    this.title,
    this.category,
    this.description,
    this.image,
    this.rating,
  });
  factory Products.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Products();
    return Products(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: Rating(
        rate: (json["rating"]["rate"] as num).toDouble(),
        count: json["rating"]["count"],
      ),
    );
  }
}
