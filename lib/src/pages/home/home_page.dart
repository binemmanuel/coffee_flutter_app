import 'package:coffee_app/src/is_dark_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../constants.dart';
import './components/menu_button.dart';
import './components/appbar_user_action.dart';
import './components/product_category_list.dart';
import './components/search_bar.dart';
import 'components/special_product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: AppBar(
            leadingWidth: 60,

            leading: MenuButton(
              onTap: () {},
              removeMaterialColor: true,
              icon: Icon(
                Ionicons.grid_outline,
                color: isDarkMode(context) ? Constants.iconColor : Colors.black,
              ),
            ),

            // User Icon
            actions: [
              AppBarUserAction(onTap: () {}),
              const SizedBox(width: 10)
            ],
          ),
        ),
      ),

      // App Content
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),

            Text(
              'Find the best \ncoffee for you',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: size.height * 0.03),

            // Search
            const SearchBar(),

            SizedBox(height: size.height * 0.035),

            const ProductCategoryList(),

            SizedBox(height: size.height * 0.035),

            const SpecialProductList(),

            SizedBox(height: size.height * 0.035),
          ],
        ),
      ),

      ///TODO: You can comment this if you decide to use the NavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.basket_outline),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.heart_outline),
            label: 'Likes',
          ),
        ],
      ),

      ///TODO: You can uncomment this to replace the BottomNavigationBar
      /* bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.basket_outline),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.heart_outline),
            label: 'Likes',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.notifications_outline),
            label: 'Notifications',
          ),
        ],
      ), */
    );
  }
}
