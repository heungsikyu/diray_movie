import 'package:diarymovie/models/themovie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import '../../models/movie_model.dart';
import '../../details/details_screen.dart';

import '../../../constants.dart';

class MovieCard extends StatelessWidget {
  final Result resultMovie;

  const MovieCard({Key key, this.resultMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: Column(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                     builder: (context) => DetailsScreen(resultMovie: resultMovie),
                  ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [kDefaultShadow],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    //image: AssetImage(resultMovie.posterPath),
                    //image: NetworkImage(resultMovie.posterPath),
                    image: NetworkImage(resultMovie.backdropPath),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              resultMovie.title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600 ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/star_fill.svg",
                height: 20.0,
              ),
              SizedBox(
                width: kDefaultPadding / 2,
              ),
              Text(
                "${resultMovie.popularity}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
