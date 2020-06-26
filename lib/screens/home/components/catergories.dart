import 'package:flutter/material.dart';
import '../../../constants.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  int selectedCategory = 0;

  List<String> categories = [
    '영화',
    'TV프로그',
    '인물',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 4 ),
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(context, index),
      ),
    );
  }

  Padding buildCategory(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w400,
                color: index == selectedCategory
                    ? kTextColor
                    : Colors.black.withOpacity(0.4),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: index == selectedCategory
                    ? kSecondaryColor
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}