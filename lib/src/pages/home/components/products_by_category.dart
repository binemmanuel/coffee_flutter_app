import 'package:coffee_app/src/pages/product_details/product_details.dart';
import 'package:flutter/material.dart';

import '../../../components/product_tile.dart';
import '../../../model/product.dart';

class ProductsByCategory extends StatelessWidget {
  const ProductsByCategory({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: products.isEmpty
          ? Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Image.asset('assets/icons/basket.png', width: 100),
                const SizedBox(height: 5),
                Text(
                  'No item found for\n this category',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];

                return ProductTile(
                  onTap: () => Navigator.pushNamed(
                      context, ProductDetails.routeName,
                      arguments: product),
                  product: product,
                );
              },
            ),
    );
  }
}
