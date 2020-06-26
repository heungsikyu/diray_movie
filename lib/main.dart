import 'package:flutter/material.dart';
import 'screens/home/movie_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie Diary",
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieScreen(),
    );
  }
}

