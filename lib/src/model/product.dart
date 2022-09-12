import 'dart:convert';

class Product {
  final int id;
  final String? title;
  final String? subtitle;
  final String? category;
  final String? featuredImage;
  final List<String>? images;
  final num? price;
  final double? rate;
  final List<String>? sizes;
  final String? description;

  Product({
    required this.id,
    this.title,
    this.subtitle,
    this.category,
    this.featuredImage,
    this.images,
    this.price,
    this.rate,
    this.sizes,
    this.description,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    if (title != null) {
      result.addAll({'title': title});
    }
    if (subtitle != null) {
      result.addAll({'subtitle': subtitle});
    }
    if (category != null) {
      result.addAll({'category': category});
    }
    if (featuredImage != null) {
      result.addAll({'featuredImage': featuredImage});
    }
    if (images != null) {
      result.addAll({'images': images});
    }
    if (price != null) {
      result.addAll({'price': price});
    }
    if (rate != null) {
      result.addAll({'rate': rate});
    }
    if (sizes != null) {
      result.addAll({'sizes': sizes});
    }
    if (description != null) {
      result.addAll({'description': description});
    }

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      title: map['title'],
      subtitle: map['subtitle'],
      category: map['category'],
      featuredImage: map['featuredImage'],
      images: List<String>.from(map['images']),
      price: map['price'],
      rate: map['rate']?.toDouble(),
      sizes: List<String>.from(map['sizes']),
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, subtitle: $subtitle, category: $category, featuredImage: $featuredImage, images: $images, price: $price, rate: $rate, sizes: $sizes, description: $description)';
  }
}
