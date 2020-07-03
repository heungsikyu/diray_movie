import 'package:diarymovie/models/themovie_model.dart';
import 'package:diarymovie/service/apifetchservies.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../constants.dart';
import 'movie_card.dart';
import 'package:http/http.dart' as http;

class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;

  int initialPage = 0;
  int fetchInitPage = 1;

  int fetchCurPage ;
  int totalResults;
  int totalPages;


  Future<List<Result>> resultMovies;

  List<Result> resMovies = List<Result>();

  @override
  void initState() {
    print(" movie carousel 3-1 init");
    super.initState();

    getFetchMovies(fetchInitPage);

    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );

    _pageController.addListener(() {
      //print("fetchCurPage : "+ (fetchCurPage).toString()+ ": " +totalResults.toString()+' : '+totalPages.toString());
      double movieCardCnt = _pageController.page + 1;
      //print("movieCardCnt : "+ (movieCardCnt).toString());

      if(movieCardCnt == (totalResults / 50)){
        print('skip~~');
      }else if((fetchCurPage * 20) == movieCardCnt){// page당 20개 영화, 페이지의 마지막 영화 카드인가?
        fetchCurPage = fetchCurPage + 1;
        getFetchMovies(fetchCurPage);
        //print('page fetch ' + fetchCurPage.toString());
      }

    });
  }

  @override
  void didChangeDependencies() {
    print(" movie carousel 3-2 did");
    super.didChangeDependencies();
    //resultMovies = ApiFetchServices.getPopularMovie("1");
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
    print('movie count ' + initialPage.toString());
    return AspectRatio(
      aspectRatio: 1.7,
      child: PageView.builder(
        // physics: ClampingScrollPhysics(),
          controller: _pageController,
          itemCount: resMovies.length,
          onPageChanged: (value){
            setState(() {
              initialPage = value;
            });
          },
          itemBuilder: (context , index) => buildMovieSlider(resMovies, index)
      ),
    );
  }


  getFetchMovies(int pageNum) async{
    String popularMovieUrl = API_BASIC_URL +
        "movie/popular?language=" +
        API_LANGUAGE['KR'] +
        "&page="+pageNum.toString()+"&api_key=" +
        API_KEY;

    final response = await http.get(popularMovieUrl);
    print(popularMovieUrl);
    if (response.statusCode == 200) {
      final TheMovie theMovie = theMovieFromJson(response.body);

      fetchCurPage = theMovie.page ;
      totalResults = theMovie.totalResults;
      totalPages = theMovie.totalPages;

      var responseMovies = theMovie.results;
      var size = responseMovies.length;
      setState((){
        for (int i = 0; size > i ; i++){
             var responseMovie = responseMovies[i];
            // print(responseMovie);
             resMovies.add(responseMovie);
        }
        //resMovies = responseMovies;
      });
    } else {
      throw Exception("Failed to load Error");
    }
  }


  Widget buildMovieSlider(data, int index) => AnimatedBuilder(
    animation: _pageController,
    builder: (context, child) {
      double value = 0;
      if (_pageController.position.haveDimensions) {
        value = index - _pageController.page;
        //value = (value * 0.038).clamp(-1, 1);
        value = (value * 0.00).clamp(-1, 1);
      }
      return AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: initialPage == index ? 1 : 0.4,
        child: Transform.rotate(
            angle: math.pi * value,
            child: MovieCard(resultMovie: data[index])),
      );
    },
  );

//  @override
//  Widget build(BuildContext context) {
//    print(" movie carousel 3-3 build");
//    print(initialPage);
//    return Padding(
//      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//      child: FutureBuilder<List<Result>>(
//        future: resultMovies,
//        builder: (context, snapshot) {
//          if (snapshot.hasData){
//            return AspectRatio(
//              aspectRatio: 1.7,
//              child: PageView.builder(
//                  controller: _pageController,
//                  physics: ClampingScrollPhysics(),
//                  onPageChanged: (value) {
//                    setState(() {
//
//                      initialPage = value;
//                    });
//                  },
//                  //itemCount: movies.length,
//                  itemCount: snapshot.data.length,
//                  itemBuilder: (context, index) => buildMovieSlider(snapshot.data, index)
//              ),
//            );
//          }else{
//            return CircularProgressIndicator();
//          }
//        }
//      ),
//    );
//  }


}
