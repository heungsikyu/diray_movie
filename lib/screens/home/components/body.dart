import 'package:flutter/material.dart';
import '../../../constants.dart';

import 'catergories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('body build 2 - stateless');

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(),
          SizedBox(height: kDefaultPadding /2 ,),
          MovieCarousel(),
          Genres(),
        ],
      ),
    );
  }
}



