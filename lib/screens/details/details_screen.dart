import 'package:diarymovie/models/themovie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import 'components/body.dart';


class DetailsScreen extends StatelessWidget {
  final Result resultMovie;

  const DetailsScreen({Key key, this.resultMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: buildAppBar(),
      body: Body(resultMovie: resultMovie),
    );
  }
}

Widget buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
    actions: <Widget>[
      IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {})
    ],
  );
}



