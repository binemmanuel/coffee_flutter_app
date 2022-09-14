import 'package:coffee_app/src/pages/product_details/components/product_size_option.dart';
import 'package:flutter/material.dart';

class ProductSizeOptions extends StatelessWidget {
  const ProductSizeOptions({
    super.key,
    required this.sizes,
    required this.onChange,
    required this.value,
  });

  final ValueSetter<String> onChange;
  final List<String> sizes;
  final String value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18, color: Colors.white.withOpacity(0.7)),
        ),

        SizedBox(height: size.height * 0.015),

        // List of sizes
        SizedBox(
          height: 40,
          child: ListView.separated(
            itemCount: sizes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              final size = sizes[index];

              return ProductSizeOption(
                onTap: () => onChange(size),
                isSelected: isSelected(size),
                size: size.toUpperCase(),
              );
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(width: 20);
            }),
          ),
        )
      ],
    );
  }

  bool isSelected(String size) => size.toLowerCase() == value.toLowerCase();
}
