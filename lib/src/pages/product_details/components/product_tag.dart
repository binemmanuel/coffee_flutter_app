import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../is_dark_mode.dart';

class ProductTag extends StatelessWidget {
  const ProductTag({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color:
            isDarkMode(context) ? Constants.backgroundDarkColor : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 30),
            const SizedBox(height: 5),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 13,
                    color: isDarkMode(context)
                        ? Colors.white.withOpacity(0.9)
                        : Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
