import 'package:diarymovie/models/themovie_model.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    Key key,
    @required this.resultMovie,
  }) : super(key: key);

  final Result resultMovie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: resultMovie.genreIds.length,
         // itemBuilder: (context, index) => GenreCard(genre: resultMovie.genreIds[index]),
        ),
      ),
    );
  }
}