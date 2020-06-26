import 'package:diarymovie/models/cast_crew_model.dart';
import 'package:diarymovie/models/themovie_model.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';



class ApiFetchServices {

  //최신 인기 영화 리스트
  static Future<List<Result>> getPopularMovie() async {
    String popularMovieUrl = API_BASIC_URL+"movie/popular?language="+API_LANGUAGE['KR']+"&page=1&api_key="+API_KEY;
    final response = await http.get(popularMovieUrl);
    if ( response.statusCode == 200){
      final TheMovie theMovie =  theMovieFromJson(response.body);
      final List<Result> _resultsMovie = theMovie.results;
      //print(_resultsMovie.toString());
      return _resultsMovie;
    } else {
      throw Exception("Failed to load Error");
    }
  }

  //영화 캐스트 정보
  static Future<List<Cast>> getMovieCast(String movieId) async {
    String movieCastUrl = API_BASIC_URL+"movie/"+movieId+"/credits?language="+API_LANGUAGE['KR']+"&page=1&api_key="+API_KEY;

    final response = await http.get(movieCastUrl);
    if ( response.statusCode == 200){
      final CastCrew castCrew =  castCrewFromJson(response.body);
      final List<Cast> _resultsCast = castCrew.cast;
      print(_resultsCast.toString());
      return _resultsCast;
    } else {
      throw Exception("function getMovieCast : Failed to load Error");
    }
  }

}




