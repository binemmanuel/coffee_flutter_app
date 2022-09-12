import 'package:coffee_app/src/model/category.dart';

class CategoryService {
  static List<Category> get demoCategories => [
        Category(type: 'cappuccino', title: 'Cappuccino'),
        Category(type: 'espresso', title: 'Espresso'),
        Category(type: 'latte', title: 'Latte'),
        Category(type: 'flat-something', title: 'Flat Something'),
      ];
}
