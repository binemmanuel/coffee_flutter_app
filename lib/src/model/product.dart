import 'dart:convert';

class Product {
  final String? title;
  final String? subtitle;
  final String? category;
  final String? featuredImage;
  final List<String>? images;
  final num? price;
  final double? rate;

  Product({
    this.title,
    this.subtitle,
    this.category,
    this.featuredImage,
    this.images,
    this.price,
    this.rate,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

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

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'],
      subtitle: map['subtitle'],
      category: map['category'],
      featuredImage: map['featuredImage'],
      images: List<String>.from(map['images']),
      price: map['price'],
      rate: map['rate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
