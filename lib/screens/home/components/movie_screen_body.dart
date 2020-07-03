import 'package:flutter/material.dart';
import '../../../constants.dart';

import 'catergories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class MovieScreenBody extends StatefulWidget {
  @override
  _MovieScreenBodyState createState() => _MovieScreenBodyState();
}

class _MovieScreenBodyState extends State<MovieScreenBody> {
  double xOffSet = 0;
  double yOffSet = 0;
  double scaleFactor = 1;
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [kDefaultShadow],
        color: Colors.white,
      ),
      transform: Matrix4.translationValues(xOffSet, yOffSet, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 200),
      // child: SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: kDefaultPadding * 2),
            Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isMenuOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffSet = 0;
                              yOffSet = 0;
                              scaleFactor = 1;
                              isMenuOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffSet = 250.0;
                              yOffSet = 150.0;
                              scaleFactor = 0.6;
                              isMenuOpen = true;
                            });
                          }),
                  Column(
                    children: <Widget>[
                      Text(
                        '영화다이어리',
                        style: TextStyle(
                            fontFamily: 'GmarketSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(),
                    ],
                  ),
                ],
              ),
            ),
            CategoryList(),
            // Genres(),
            SizedBox(height: kDefaultPadding),
            MovieCarousel(),
            MovieCarousel(),
            MovieCarousel(),
          ],
        ),
      ),
    );
  }
}
