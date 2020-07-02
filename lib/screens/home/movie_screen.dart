import 'package:diarymovie/screens/menu/menu_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

import 'components/movie_screen_body.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        //appBar: buildAppBar(),
        body: Stack(
          children: <Widget>[
            MenuDashboard(),
            MovieScreenBody(),
          ],
        )

    );
  }
}


//class MovieScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    print('MovieScreen build 1 - stateless');
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: buildAppBar(),
//      body: Stack(
//        children: <Widget>[
//          MenuDashboard(),
//          MovieScreenBody(),
//        ],
//      )
//
//    );
//  }
//}

Widget buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
        //icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {
          print(" menu pressed ");
        }),
    actions: <Widget>[
      IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //icon: SvgPicture.asset("assets/icons/search.svg"),
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {})
    ],
  );
}
