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
                padding: EdgeInsets.only(right: isLast(index) ? 0 : 20.0),
                child: InkWell(
                  onTap: () => onChange(category.type!),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          '${category.title}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                color: isSelected(category.type!)
                                    ? Constants.mainAppColor
                                    : const Color.fromARGB(153, 255, 255, 255),
                                fontSize: 18,
                              ),
                        ),
                      ),

                      // Active Indicator
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: isSelected(category.type!)
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(14, 13, 24, 33),
                    Color.fromARGB(228, 0, 0, 0),
                  ],
                  stops: [0.1, 0.8, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isSelected(String type) => value.toLowerCase() == type.toLowerCase();
  bool isLast(int index) => index == (options.length - 1);
}
