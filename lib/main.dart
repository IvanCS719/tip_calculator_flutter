import 'package:flutter/material.dart';
import 'package:tip_calculator/config/theme/app_theme.dart';
import 'package:tip_calculator/presentation/screens/home_screen.dart';

void main() {
  runApp(const  MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDarkMode = false;

  void toggleTheme(){
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(seletedColor: 2, isDarkMode: isDarkMode).getTheme(),
      debugShowCheckedModeBanner: false, home: HomeScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode,));
  }
}
