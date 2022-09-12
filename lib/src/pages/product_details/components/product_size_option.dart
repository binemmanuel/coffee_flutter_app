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
          color:
              isSelected ? Colors.transparent : Constants.backgroundDarkColor,
          border: Border.all(
              color: isSelected ? Constants.mainAppColor : Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          size,
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: isSelected
                  ? Constants.mainAppColor
                  : Colors.white.withOpacity(0.8),
              fontSize: 18),
        ),
      ),
    );
  }
}
