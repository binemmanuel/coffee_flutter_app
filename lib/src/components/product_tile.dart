import 'package:coffee_app/src/is_dark_mode.dart';
import 'package:coffee_app/src/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../constants.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.onTap, required this.product});

  final VoidCallback onTap;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5).copyWith(
        right: 17,
        left: 3,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: isDarkMode(context)
                  ? Constants.darkGradient
                  : Constants.lightGradient,
              begin: Alignment.topLeft,
            ),
            boxShadow: Constants.darkBoxShadow,
          ),
          width: size.width / 2.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Image
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Hero(
                      tag: product.id,
                      child: Container(
                        width: double.infinity,
                        height: size.height * 0.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              product.featuredImage!,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Rate
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isDarkMode(context)
                              ? Colors.black54
                              : Colors.white54,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),

                            const SizedBox(width: 5),

                            // Rate
                            Text(
                              '${product.rate}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Titles
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Title
                    Text(
                      product.title!,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18),
                    ),

                    const SizedBox(height: 2.5),

                    // Product Subtitle
                    Text(
                      product.subtitle!,
                      style: TextStyle(
                        color: isDarkMode(context)
                            ? Colors.white60
                            : Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Footer
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              '\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 22,
                                    color: Constants.mainAppColor,
                                  ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 22),
                            ),
                          ],
                        ),
                      ),

                      // Add to cart button
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Constants.mainAppColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            CupertinoIcons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
