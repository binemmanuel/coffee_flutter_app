import 'dart:io';

import 'package:coffee_app/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 5, 9, 12),

        splashColor: Constants.backgroundColor,

        // App Bar styles
        appBarTheme: const AppBarTheme(
          foregroundColor: Constants.mainAppColor,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Constants.backgroundColor,
          elevation: 0,
        ),

        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.transparent,
          // indicatorColor: Constants.mainAppColor,
          indicatorColor: Colors.transparent,
          surfaceTintColor: Constants.backgroundColor,
          iconTheme: MaterialStatePropertyAll(
            IconThemeData(color: Colors.white),
          ),
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(color: Colors.white54),
          ),
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),

        // Text Theme
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
        ),

        // Input Theme
        inputDecorationTheme: InputDecorationTheme(
          fillColor: const Color.fromARGB(94, 20, 41, 58),
          filled: true,
          focusedBorder: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIconColor: Colors.grey,
          contentPadding: EdgeInsets.all(Platform.isIOS ? 15 : 10),
        ),
      ),

      // Initial Page
      home: const HomePage(),
    );
  }
}
