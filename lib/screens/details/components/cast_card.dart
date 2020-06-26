import 'package:diarymovie/models/cast_crew_model.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({Key key, this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding),
      width: 90,
      child: Column(
        children: <Widget>[
          Container(
            height: 90,
            decoration: BoxDecoration(
              //shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: cast.profilePath == null ? AssetImage("assets/images/blank-profile.png") : NetworkImage(cast.profilePath),
                //image: AssetImage(cast.profilePath),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Text(
            cast.character,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 2,
          ),
          Text(
            cast.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextLightColor, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}