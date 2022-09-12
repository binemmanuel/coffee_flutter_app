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
      margin: const EdgeInsets.only(right: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(95, 17, 51, 79),
                Color.fromARGB(160, 31, 31, 31),
                Color.fromARGB(142, 21, 21, 21),
              ],
              begin: Alignment.topLeft,
            ),
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
                    Container(
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

                    // Rate
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
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
                                  .headline6!
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
                          .headline6!
                          .copyWith(fontSize: 18),
                    ),

                    const SizedBox(height: 5),

                    // Product Subtitle
                    Text(
                      product.subtitle!,
                      style:
                          const TextStyle(color: Colors.white60, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Footer
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  .headline6!
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
                                  .headline6!
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