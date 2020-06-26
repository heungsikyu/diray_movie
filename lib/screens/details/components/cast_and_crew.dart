
import 'package:diarymovie/models/cast_crew_model.dart';
import 'package:diarymovie/models/themovie_model.dart';
import 'package:diarymovie/service/apifetchservies.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'cast_card.dart';


class CastAndCrew extends StatelessWidget {

  const CastAndCrew({
    Key key,
    @required this.resultMovie
  }) : super(key: key);

   final Result resultMovie;
   //Future<List<Cast>> cast;

  @override
  Widget build(BuildContext context) {
     //cast = ApiFetchServices.getMovieCast(resultMovie.id.toString());

    return Container(
        child: FutureBuilder<List<Cast>>(
          future: ApiFetchServices.getMovieCast(resultMovie.id.toString()),
          builder: (context, snapshot){
           if(snapshot.hasData){
             //print(snapshot.data);
             return Container(
               child: Padding(
                 padding: const EdgeInsets.all(kDefaultPadding),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(
                      "등장 인물",
                      style: Theme.of(context).textTheme.headline6,
                     ),
                     SizedBox(
                      height: kDefaultPadding ,
                     ),
                     SizedBox(
                      height: 180.0,
                      child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: snapshot.data.length,
                       itemBuilder: (context, index) => CastCard(cast: snapshot.data[index]),
                      ),
                    ),
                   ],
                 ),
               ),
             );
           }else{
             return Center(child: CircularProgressIndicator());
           }
        }
      ),
    );
  }
}