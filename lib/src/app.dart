import 'dart:io';

import 'package:coffee_app/my_router.dart';
import 'package:coffee_app/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: MyRouter.generate,

      initialRoute: HomePage.routeName,

      theme: ThemeData(
        primarySwatch: Colors.orange,

        useMaterial3: true,

        // primarySwatch: Colors.orange,
        // scaffoldBackgroundColor: const Color.fromARGB(255, 5, 9, 12),

        splashColor: Constants.backgroundColor,

        // App Bar styles
        appBarTheme: const AppBarTheme(
          foregroundColor: Constants.backgroundDarkColor,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.white,
          elevation: 0,
        ),

        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          surfaceTintColor: Constants.backgroundColor,
          iconTheme: MaterialStatePropertyAll(
            IconThemeData(color: Colors.black),
          ),
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(color: Colors.black),
          ),
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          unselectedItemColor: Constants.backgroundDarkColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),

        // Text Theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Constants.backgroundDarkColor),
          displayMedium: TextStyle(color: Constants.backgroundDarkColor),
          displaySmall: TextStyle(color: Constants.backgroundDarkColor),
          headlineMedium: TextStyle(color: Constants.backgroundDarkColor),
          headlineSmall: TextStyle(color: Constants.backgroundDarkColor),
          headlineLarge: TextStyle(color: Constants.backgroundDarkColor),
          titleLarge: TextStyle(color: Constants.backgroundDarkColor),
          titleMedium: TextStyle(color: Constants.backgroundDarkColor),
          titleSmall: TextStyle(color: Constants.backgroundDarkColor),
        ),

        // Input Theme
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Constants.backgroundColor.withOpacity(0.1),
          filled: true,
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.black45),
          prefixIconColor: Colors.black45,
          contentPadding: EdgeInsets.all(Platform.isIOS ? 15 : 10),
        ),
      ),

      darkTheme: ThemeData(
        primarySwatch: Colors.orange,

        useMaterial3: true,

        primaryColor: Constants.mainAppColor,

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
          // selectedItemColor: Constants.mainAppColor,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),

        // Text Theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
        ),

        // Input Theme
        inputDecorationTheme: InputDecorationTheme(
          fillColor: const Color.fromARGB(94, 20, 41, 58),
          filled: true,
          border: InputBorder.none,
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
