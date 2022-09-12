import 'dart:developer';

import 'package:coffee_app/src/pages/home/home_page.dart';
import 'package:coffee_app/src/pages/product_details/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route generate(RouteSettings settings) {
    log(settings.toString());

    return MaterialPageRoute(
      settings: settings,
      builder: ((context) {
        switch (settings.name) {
          case HomePage.routeName:
            return const HomePage();

          case ProductDetails.routeName:
            return const ProductDetails();

          default:
            return Scaffold(
              body: Center(
                child: Text(
                  "Not Found",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            );
        }
      }),
    );
  }
}
