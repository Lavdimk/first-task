import 'package:first_task/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      theme: themeManager.isDarkMode
          ? themeManager.darkTheme
          : themeManager.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: themeManager.appBarColor,
          toolbarHeight: 100.0,
          title: Row(
            children: [
              const SizedBox(width: 140.0),
              const Text(
                'Home',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  themeManager.isDarkMode
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                ),
                onPressed: () {
                  themeManager.toggleTheme();
                },
              ),
            ],
          ),
        ),
        backgroundColor: themeManager.isDarkMode
            ? themeManager.darkTheme.backgroundColor
            : themeManager.lightTheme.backgroundColor,
        body: Center(
          child: Text(
            'Welcome to my super duper app',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: themeManager.isDarkMode
                  ? themeManager.darkTheme.primaryColor
                  : themeManager.lightTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
