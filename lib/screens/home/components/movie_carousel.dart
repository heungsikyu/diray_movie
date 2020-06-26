import 'package:diarymovie/models/themovie_model.dart';
import 'package:diarymovie/service/apifetchservies.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../constants.dart';
import 'movie_card.dart';


class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;
  int initialPage = 1;

 Future<List<Result>> resultMovies ;

  @override
  void initState() {
    print(" movie carousel 3-1 init");
    super.initState();
    resultMovies = ApiFetchServices.getPopularMovie();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void didChangeDependencies() {
    print(" movie carousel 3-2 did");
    super.didChangeDependencies();
    resultMovies = ApiFetchServices.getPopularMovie();
  }

  @override
  void dispose() {
    super.dispose();
    print(" movie carousel 3-4 dispose");
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(" movie carousel 3-3 build");
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      child: FutureBuilder<List<Result>>(
        future: resultMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      initialPage = value;
                    });
                  },
                  controller: _pageController,
                  physics: ClampingScrollPhysics(),
                  //itemCount: movies.length,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => buildMovieSlider(snapshot.data, index)
              ),
            );
          }else{
            return CircularProgressIndicator();
          }
        }
      ),
      
    );
  }

  Widget buildMovieSlider(data, int index) => AnimatedBuilder(
    animation: _pageController,
    builder: (context, child) {
      double value = 0;
      if (_pageController.position.haveDimensions) {
        value = index - _pageController.page;
        value = (value * 0.038).clamp(-1, 1);
      }
      return AnimatedOpacity(
        duration: Duration(milliseconds: 350),
        opacity: initialPage == index ? 1 : 0.4,
        child: Transform.rotate(
            angle: math.pi * value, child: MovieCard(resultMovie: data[index])),
      );
    },
  );
}
