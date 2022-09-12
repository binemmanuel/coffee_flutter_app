import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppBarUserAction extends StatelessWidget {
  const AppBarUserAction({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(85, 183, 183, 183),
              Color.fromARGB(112, 14, 14, 14),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          height: double.infinity,
          width: 50,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1760&q=80',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
