import 'package:flutter/material.dart';

import '../../../constants.dart';

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
        color: Constants.backgroundDarkColor,
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
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 14, color: Colors.white.withOpacity(0.9)),
            ),
          ],
        ),
      ),
    );
  }
}
