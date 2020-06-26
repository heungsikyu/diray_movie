import 'package:diarymovie/models/themovie_model.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'cast_and_crew.dart';
import 'title_duration_and_fabbtn.dart';
import 'backdrop_rating.dart';

class Body extends StatelessWidget {
  final Result resultMovie;

  const Body({Key key, this.resultMovie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         // Padding(padding: EdgeInsets.only(top: kDefaultPadding * 2),),
          BackdropAndRation(size: size, resultMovie: resultMovie),
          SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabBtn(resultMovie: resultMovie),
          //MovieGenres(resultMovie: resultMovie),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
            child: Text(
              "줄거리",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              resultMovie.overview,
              style: TextStyle(
                color: Color(0xFF737599),
              ),
            ),
          ),
          CastAndCrew(resultMovie: resultMovie),
        ],
      ),
    );
  }
}


