import 'package:flutter/material.dart';

import 'package:coffee_app/src/model/product.dart';
import 'package:coffee_app/src/pages/home/home_page.dart';
import 'package:coffee_app/src/pages/product_details/product_details.dart';

class MyRouter {
  static Route generate(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: ((context) {
        switch (settings.name) {
          case HomePage.routeName:
            return const HomePage();

          case ProductDetails.routeName:
            final product = settings.arguments as Product;

            return ProductDetails(product: product);

          default:
            return Scaffold(
              body: Center(
                child: Text(
                  "Not Found",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            );
        }
      }),
    );
  }
}
