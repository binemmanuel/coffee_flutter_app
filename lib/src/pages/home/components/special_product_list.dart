import 'dart:io';

import 'package:coffee_app/src/pages/product_details/product_details.dart';
import 'package:flutter/material.dart';

import '../../../components/product_tile_full_width.dart';
import '../../../model/product.dart';
import '../../../service/product_service.dart';

class SpecialProductList extends StatefulWidget {
  const SpecialProductList({super.key});

  @override
  State<SpecialProductList> createState() => _SpecialProductListState();
}

class _SpecialProductListState extends State<SpecialProductList> {
  late List<Product> demoProducts;

  @override
  void initState() {
    super.initState();

    demoProducts = ProductService.demoProducts;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Special or you',
          style: Theme.of(context).textTheme.headline6,
        ),

        SizedBox(height: size.height * 0.02),

        // Spacial Products
        SizedBox(
          height: Platform.isIOS ? size.height * 0.18 : size.height * 0.2,
          child: ListView.builder(
            itemCount: demoProducts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final product = demoProducts[index];

              return ProductTileFullWidth(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ProductDetails.routeName,
                    arguments: product,
                  );
                },
                product: product,
              );
            },
          ),
        ),
      ],
    );
  }
}
