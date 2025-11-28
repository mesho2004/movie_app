import 'package:flutter/material.dart';
import 'package:movie_app/feature/details/view/details_screen.dart';

void main(){
  runApp(MovieApp());
}
class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DetailsScreen.routeName,
      routes: {
        DetailsScreen.routeName: (context) => DetailsScreen(movieId: 1419406),
      },
    );
  }
}