import 'package:flutter/material.dart';
 feature/serach
import 'package:movie_app/core/utils/app_colors.dart';
import 'main_screen.dart';
=======
import 'package:movie_app/feature/details/view/details_screen.dart';
 main

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 feature/serach
      title: 'Movie App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: AppColors.whiteColor,
          titleTextStyle: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundColor,
          selectedItemColor: AppColors.blueColor,
          unselectedItemColor: AppColors.unselectedItemColor,
          type: BottomNavigationBarType.fixed,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),

      routes: {MainScreen.routeName: (context) => const MainScreen()},

      initialRoute: DetailsScreen.routeName,
      routes: {
        DetailsScreen.routeName: (context) => DetailsScreen(movieId: 1419406),
      },
 main
    );
  }
}
