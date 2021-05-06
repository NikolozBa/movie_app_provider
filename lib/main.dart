import 'package:flutter/material.dart';
import 'package:movie_app/screens/add_new_movie_scren.dart';
import 'package:movie_app/screens/edit_movie_screen.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';

import 'data/models/data_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataModel(),
      child: MaterialApp(
        title: 'Movies App',
        theme: ThemeData(
          accentColor: Colors.purpleAccent,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
            )
          )

        ),
        home: HomeScreen(),
        routes: {
          MovieDetailsScreen.routeName: (ctx) => MovieDetailsScreen(),
          AddNewMovieScreen.routeName: (ctx) => AddNewMovieScreen(),
          EditMovieScreen.routeName: (ctx) => EditMovieScreen(),
        },
      ),
    );
  }
}

