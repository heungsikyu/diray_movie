import 'package:diarymovie/models/themovie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../models/movie_model.dart';
import '../../../constants.dart';


class BackdropAndRation extends StatelessWidget {
  const BackdropAndRation({
    Key key,
    @required this.size,
    @required this.resultMovie,
  }) : super(key: key);

  final Size size;
  final Result resultMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      //전체 화면의 높이 40%
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 50.0,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(50.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                //image: AssetImage(resultMovie.backdrop),
                image: NetworkImage(resultMovie.backdropPath),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.9,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/star_fill.svg"),
                      SizedBox(height: kDefaultPadding / 4),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "${resultMovie.voteAverage}/",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: "10\n",
                              ),
                              TextSpan(
                                text: "103,232",
                                style: TextStyle(color: kTextLightColor),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  //Rating
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/star.svg"),
                      SizedBox(
                        height: kDefaultPadding / 4,
                      ),
                      Text(
                        "Rating This",
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                  //meta score
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF51CF66),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Text(
                          "${resultMovie.popularity}",
                          style: TextStyle(
                              color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 4),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Metascore\n",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
//                              TextSpan(
//                                text:
//                                "${resultMovie.criticsReview} critic reviews",
//                                style: TextStyle(color: kTextLightColor),
//                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //back button
          SafeArea(child: BackButton())
        ],
      ),
    );
  }
}