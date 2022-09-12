import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontSize: 18, color: Colors.white.withOpacity(0.7)),
        ),
        SizedBox(height: size.height * 0.015),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: '$description... '),
              const TextSpan(
                text: 'Read More',
                style: TextStyle(color: Constants.mainAppColor),
              ),
            ],
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 17),
          ),
          maxLines: 2,
        ),
      ],
    );
  }
}
