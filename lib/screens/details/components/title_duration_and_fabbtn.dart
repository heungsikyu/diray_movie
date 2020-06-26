import 'package:diarymovie/models/themovie_model.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key key,
    @required this.resultMovie,
  }) : super(key: key);

  final Result resultMovie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  resultMovie.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      "${resultMovie.releaseDate}",
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(width: kDefaultPadding),
//                    Text("${resultMovie.productNo}", style: TextStyle(color: kTextLightColor),),
//                    SizedBox(width: kDefaultPadding),
//                    Text("${resultMovie.runningtime}", style: TextStyle(color: kTextLightColor),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 64.0,
            height: 64.0,
            child: FlatButton(
              color: kSecondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {},
              child: Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}