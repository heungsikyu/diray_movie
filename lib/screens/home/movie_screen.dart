import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

import 'components/body.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MovieScreen build 1 - stateless');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}

Widget buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
        //icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
      icon: Icon(Icons.menu, color: Colors.black,) ,
      onPressed: () {}),
    actions: <Widget>[
      IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //icon: SvgPicture.asset("assets/icons/search.svg"),
          icon: Icon(Icons.search, color: Colors.black,),
          onPressed: () {})
    ],
  );
}
