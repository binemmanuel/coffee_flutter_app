import 'package:coffee_app/src/pages/home/components/category_options.dart';
import 'package:coffee_app/src/pages/home/components/products_by_category.dart';
import 'package:flutter/material.dart';

import '../../../model/category.dart';
import '../../../model/product.dart';
import '../../../service/category_service.dart';
import '../../../service/product_service.dart';

class ProductCategoryList extends StatefulWidget {
  const ProductCategoryList({super.key});

  @override
  State<ProductCategoryList> createState() => _ProductCategoryListState();
}

class _ProductCategoryListState extends State<ProductCategoryList> {
  late List<Product> demoProducts;
  late List<Category> demoCategories;

  String selectedCategory = 'cappuccino';

  @override
  void initState() {
    super.initState();

    demoCategories = CategoryService.demoCategories;
    demoProducts = ProductService.getProductByCategory(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        CategoryOptions(
          onChange: handleCategoryChange,
          options: demoCategories,
          value: selectedCategory,
        ),

        SizedBox(height: size.height * 0.02),

        // Product Listing
        ProductsByCategory(products: demoProducts),
      ],
    );
  }

  void handleCategoryChange(String value) {
    selectedCategory = value;

    demoProducts = ProductService.getProductByCategory(selectedCategory);

    setState(() {});
  }
}
