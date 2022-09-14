import 'package:coffee_app/src/is_dark_mode.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductTagTextOnly extends StatelessWidget {
  const ProductTagTextOnly({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isDarkMode(context) ? Constants.backgroundDarkColor : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 13,
              color: isDarkMode(context)
                  ? Colors.white.withOpacity(0.9)
                  : Colors.black,
            ),
      ),
    );
  }
}
