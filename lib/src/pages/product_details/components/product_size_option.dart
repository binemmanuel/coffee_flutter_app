import 'package:coffee_app/src/is_dark_mode.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductSizeOption extends StatelessWidget {
  const ProductSizeOption({
    super.key,
    required this.isSelected,
    required this.size,
    required this.onTap,
  });

  final bool isSelected;
  final String size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected
                ? Colors.transparent
                : isDarkMode(context)
                    ? Constants.backgroundDarkColor
                    : Colors.white,
            border: Border.all(
                color:
                    isSelected ? Constants.mainAppColor : Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? []
                : const [
                    BoxShadow(
                        color: Color.fromARGB(41, 0, 0, 0), blurRadius: 5),
                  ]),
        child: Text(
          size,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: isSelected
                  ? Constants.mainAppColor
                  : isDarkMode(context)
                      ? Colors.white.withOpacity(0.8)
                      : Colors.black.withOpacity(0.8),
              fontSize: 18),
        ),
      ),
    );
  }
}
