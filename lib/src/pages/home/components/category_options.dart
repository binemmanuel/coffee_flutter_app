import 'package:coffee_app/src/is_dark_mode.dart';
import 'package:flutter/material.dart';

import 'package:coffee_app/src/model/category.dart';

import '../../../constants.dart';

class CategoryOptions extends StatelessWidget {
  const CategoryOptions({
    super.key,
    required this.options,
    required this.value,
    required this.onChange,
  });

  final List<Category> options;
  final String value;
  final ValueSetter<String> onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: options.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final category = options[index];

              return Padding(
                padding: EdgeInsets.only(right: _isLast(index) ? 0 : 20.0),
                child: InkWell(
                  onTap: () => onChange(category.type!),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          '${category.title}',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: _isSelected(category.type!)
                                        ? Constants.mainAppColor
                                        : _getTextColor(context),
                                    fontSize: 18,
                                  ),
                        ),
                      ),

                      // Active Indicator
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: _isSelected(category.type!)
                              ? Constants.mainAppColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Over layer
          IgnorePointer(
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDarkMode(context)
                      ? const [
                          Colors.transparent,
                          Color.fromARGB(14, 13, 24, 33),
                          Color.fromARGB(228, 0, 0, 0),
                        ]
                      : const [
                          Colors.transparent,
                          Color.fromARGB(14, 255, 255, 255),
                          Color.fromARGB(226, 255, 255, 255),
                        ],
                  stops: const [0.1, 0.8, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isSelected(String type) => value.toLowerCase() == type.toLowerCase();
  bool _isLast(int index) => index == (options.length - 1);

  // Return text color based on theme (light or dark)
  Color _getTextColor(BuildContext context) => isDarkMode(context)
      ? const Color.fromARGB(153, 255, 255, 255)
      : Colors.black38;
}
