import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Find You Coffee...',
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20, right: 10),
            child: Icon(Ionicons.search),
          ),
        ),
      ),
    );
  }
}
