import 'package:flutter/material.dart';

// Colos that use in our app
const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);


// apikey
const API_BASIC_URL ='https://api.themoviedb.org/3/';
const API_KEY = '4994de80a80b502369c0d4e331185b0c';

// ignore: non_constant_identifier_names
const Map API_LANGUAGE = {
  "KR": "ko-KR",
};