import 'dart:io';

import 'package:coffee_app/src/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/src/constants.dart';
import 'package:coffee_app/src/pages/home/components/menu_button.dart';
import 'package:ionicons/ionicons.dart';

import '../../model/product.dart';
import './components/product_tag.dart';
import './components/product_tag_text_only.dart';
import './components/product_description.dart';
import './components/product_size_options.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;

  static const String routeName = '/single-product';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedSize = 'S';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.product.id,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Stack(
                children: [
                  // Featured Image
                  Container(
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          widget.product.featuredImage!,
                        ),
                      ),
                    ),
                  ),

                  // App Bar
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
                          MenuButton(
                            onTap: () => Navigator.pop(context),
                            padding: const EdgeInsets.all(13),
                            icon: Icon(
                              Platform.isAndroid
                                  ? Ionicons.arrow_back
                                  : CupertinoIcons.back,
                              color: Constants.iconColor,
                            ),
                          ),

                          // Add to fav button
                          MenuButton(
                            onTap: () {},
                            padding: const EdgeInsets.all(12),
                            icon: const Icon(
                              Ionicons.heart,
                              color: Constants.iconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: size.height * 0.2,
                      padding: const EdgeInsets.all(20),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: isDarkMode(context)
                            ? const Color.fromARGB(188, 0, 0, 0)
                            : const Color.fromARGB(19, 255, 255, 255),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(55, 255, 255, 255),
                            blurRadius: 9.0,
                            blurStyle: BlurStyle.inner,
                          ),
                          BoxShadow(
                            color: Color.fromARGB(68, 210, 126, 0),
                            blurRadius: 9.0,
                            blurStyle: BlurStyle.inner,
                          ),
                          BoxShadow(
                            color: Color.fromARGB(67, 17, 51, 79),
                            blurRadius: 9.0,
                            blurStyle: BlurStyle.inner,
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title and Rate
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title!,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                widget.product.subtitle!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 16,
                                      color: isDarkMode(context)
                                          ? Colors.white54
                                          : Colors.black54,
                                    ),
                              ),

                              // Rate
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        CupertinoIcons.star_fill,
                                        color: Constants.mainAppColor,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        widget.product.rate.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        '(${widget.product.rate})',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: isDarkMode(context)
                                                  ? Colors.white54
                                                  : Colors.black54,
                                              fontSize: 15,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Tags
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  ProductTag(
                                    icon: 'assets/icons/coffee-beans.png',
                                    title: 'Coffee',
                                  ),
                                  SizedBox(width: 15),
                                  ProductTag(
                                    icon: 'assets/icons/drop.png',
                                    title: 'Milk',
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),

                              //
                              const Expanded(
                                child: ProductTagTextOnly(
                                  title: 'Medium Roasted',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: size.height * 0.02),

          // Product Description and more
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description
                  Expanded(
                    child: ProductDescription(
                      description: widget.product.description!,
                    ),
                  ),

                  // List of Sizes
                  Expanded(
                    child: ProductSizeOptions(
                      onChange: handleSizeChange,
                      sizes: widget.product.sizes!,
                      value: selectedSize,
                    ),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Price Tag
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Price',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 14,
                                      color: isDarkMode(context)
                                          ? Colors.white.withOpacity(0.7)
                                          : Colors.black.withOpacity(0.7),
                                    ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$ ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Constants.mainAppColor),
                                    ),
                                    TextSpan(
                                      text: widget.product.price.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color: isDarkMode(context)
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: BuyNowButton(
                            onTap: () {},
                            title: 'Buy Now',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void handleSizeChange(String value) {
    selectedSize = value;

    setState(() {});
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 55,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Constants.mainAppColor.withAlpha(220),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
        ),
      ),
    );
  }
}
