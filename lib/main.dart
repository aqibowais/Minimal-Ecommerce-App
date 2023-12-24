import 'package:flutter/material.dart';
import 'package:minimal_ecom/models/shop.dart';
import 'package:minimal_ecom/pages/cart_page.dart';
import 'package:minimal_ecom/pages/intro_page.dart';
import 'package:minimal_ecom/pages/setting_page.dart';
import 'package:minimal_ecom/pages/shop_page.dart';
import 'package:minimal_ecom/themes/dark_mode.dart';
import 'package:minimal_ecom/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

// bool isDarkMode = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? darkMode : lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/setting_page': (context) => SettingPage(
              isDarkMode: isDarkMode,
              toggleTheme: toggleTheme,
            ),
      },
    );
  }
}
