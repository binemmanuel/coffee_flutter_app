import 'package:coffee_app/src/constants.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    this.onTap,
    required this.icon,
    this.padding,
    this.borderRadius,
    this.removeMaterialColor = false,
  });

  final VoidCallback? onTap;
  final Widget icon;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final bool removeMaterialColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          removeMaterialColor ? Colors.transparent : Constants.backgroundColor,
      borderRadius: borderRadius ?? BorderRadius.circular(18),
      // clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.black,
        borderRadius: borderRadius ?? BorderRadius.circular(18),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(18),
            border: Border.all(
              color: const Color.fromARGB(92, 34, 76, 101),
            ),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(95, 17, 51, 79),
                Color.fromARGB(39, 13, 25, 32),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(76, 91, 67, 32),
                blurRadius: 20,
                blurStyle: BlurStyle.inner,
              )
            ],
          ),
          child: icon,
        ),
      ),
    );
  }
}
