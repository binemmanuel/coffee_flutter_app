import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.black,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
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
        child: const Icon(
          Ionicons.grid_outline,
          color: Color.fromARGB(255, 132, 132, 132),
        ),
      ),
    );
  }
}
