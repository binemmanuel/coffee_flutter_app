import 'dart:convert';

class Category {
  final String? type;
  final String? title;

  Category({this.type, this.title});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (type != null) {
      result.addAll({'type': type});
    }
    if (title != null) {
      result.addAll({'title': title});
    }

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      type: map['type'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(type: $type, title: $title)';
}
